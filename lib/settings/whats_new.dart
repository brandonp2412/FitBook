import 'package:fit_book/update_notice.dart';
import 'dart:convert';

import 'package:fit_book/logging.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({super.key});

  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class Changelog {
  final String name;
  final String content;
  final String created;

  Changelog({required this.name, required this.content, required this.created});
}

// Some historical changelogs were created on Windows and use .NET/Windows
// ticks (100-nanosecond intervals since 1601), while current releases use
// Unix seconds.
List<String> changelogTranslationAssetCandidates(Locale locale) {
  final languageTag = locale.toLanguageTag();
  final candidates = <String>['assets/changelog_l10n/$languageTag.json'];
  if (languageTag != locale.languageCode) {
    candidates.add('assets/changelog_l10n/${locale.languageCode}.json');
  }
  return candidates;
}

DateTime changelogDateFromTimestamp(int timestamp) {
  const windowsEpochInTicks = 116444736000000000;
  const ticksPerMillisecond = 10000;

  final milliseconds = timestamp >= windowsEpochInTicks
      ? (timestamp - windowsEpochInTicks) ~/ ticksPerMillisecond
      : timestamp * Duration.millisecondsPerSecond;
  return DateTime.fromMillisecondsSinceEpoch(milliseconds);
}

class _WhatsNewState extends State<WhatsNew> {
  static const _pageSize = 10;
  List<Changelog> changelogs = [];
  bool _showUpdateNotices = true;
  List<String> _changelogFiles = [];
  int _page = 0;
  bool _isLoading = true;
  Locale? _loadedLocale;

  @override
  void initState() {
    super.initState();
    _loadUpdateNoticePreference();
  }

  Future<void> _loadUpdateNoticePreference() async {
    try {
      final enabled = await updateNoticesEnabled();
      if (mounted) setState(() => _showUpdateNotices = enabled);
    } catch (error) {
      debugPrint('Unable to load update notice preference: $error');
    }
  }

  Future<void> _setUpdateNotices(bool enabled) async {
    try {
      await setUpdateNoticesEnabled(enabled);
      if (mounted) setState(() => _showUpdateNotices = enabled);
    } catch (error) {
      debugPrint('Unable to save update notice preference: $error');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    if (_loadedLocale == locale) return;
    _loadedLocale = locale;
    setChangelogs();
  }

  void setChangelogs() async {
    final files = await _getChangelogFiles(context);
    if (!mounted) return;
    setState(() {
      _changelogFiles = files;
      _page = 0;
      _isLoading = true;
    });
    final logs = await _loadChangelogPage(context, files, 0);
    if (!mounted) return;
    setState(() {
      changelogs = logs;
      _isLoading = false;
    });
  }

  Future<List<String>> _getChangelogFiles(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final manifest = await AssetManifest.loadFromAssetBundle(assetBundle);
    final availableAssets = manifest.listAssets().toSet();
    final files = availableAssets
        .where((key) => RegExp(r'^assets/changelogs/\d+\.txt$').hasMatch(key))
        .toList();

    files.sort((a, b) {
      final aName = a.split('/').last.split('.').first;
      final bName = b.split('/').last.split('.').first;
      final aNum = int.tryParse(aName) ?? 0;
      final bNum = int.tryParse(bName) ?? 0;
      return changelogDateFromTimestamp(bNum)
          .compareTo(changelogDateFromTimestamp(aNum));
    });
    return files;
  }

  Future<List<Changelog>> _loadChangelogPage(
    BuildContext context,
    List<String> files,
    int page,
  ) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final activeLocale = Localizations.localeOf(context);
    final locale = activeLocale.toLanguageTag();
    final manifest = await AssetManifest.loadFromAssetBundle(assetBundle);
    final availableAssets = manifest.listAssets().toSet();
    final translations = await _loadChangelogTranslations(
      assetBundle,
      availableAssets,
      activeLocale,
    );
    final start = page * _pageSize;
    final pageFiles = files.skip(start).take(_pageSize);
    final result = <Changelog>[];
    for (final path in pageFiles) {
      try {
        final content = await rootBundle.loadString(path);
        final filename = path.split('/').last.replaceAll('.txt', '');
        final timestamp = int.tryParse(filename);
        if (timestamp == null || filename.isEmpty) {
          talker.warning('Skipping invalid changelog asset: $path');
          continue;
        }
        result.add(
          Changelog(
            name: filename,
            created: DateFormat.yMMMd(locale)
                .format(changelogDateFromTimestamp(timestamp)),
            content: translations[filename] ?? content,
          ),
        );
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          'Unable to load changelog asset: $path',
        );
      }
    }
    return result;
  }

  Future<void> _setPage(int page) async {
    if (page < 0 || page >= (_changelogFiles.length / _pageSize).ceil()) {
      return;
    }
    setState(() {
      _page = page;
      _isLoading = true;
    });
    final logs = await _loadChangelogPage(context, _changelogFiles, page);
    if (!mounted || _page != page) return;
    setState(() {
      changelogs = logs;
      _isLoading = false;
    });
  }

  Future<Map<String, String>> _loadChangelogTranslations(
    AssetBundle assetBundle,
    Set<String> availableAssets,
    Locale locale,
  ) async {
    for (final path in changelogTranslationAssetCandidates(locale)) {
      if (!availableAssets.contains(path)) continue;
      try {
        final json = jsonDecode(await assetBundle.loadString(path));
        return (json as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, value as String),
        );
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          'Unable to load localized changelog asset: $path',
        );
      }
    }
    return const {};
  }

  @override
  Widget build(BuildContext context) {
    final nestedTabRoute =
        Navigator.of(context) != Navigator.of(context, rootNavigator: true);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.whatsNew)),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            title: Text(context.l10n.showUpdateNotices),
            value: _showUpdateNotices,
            onChanged: _setUpdateNotices,
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Text(changelogs[index].created),
                      subtitle: Text(changelogs[index].content),
                    ),
                    itemCount: changelogs.length,
                  ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, nestedTabRoute ? 88 : 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_changelogFiles.isNotEmpty)
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed:
                              _page > 0 ? () => _setPage(_page - 1) : null,
                          icon: const Icon(Icons.chevron_left),
                          tooltip: MaterialLocalizations.of(context)
                              .previousPageTooltip,
                        ),
                        Text(
                          '${_page + 1} / ${(_changelogFiles.length / _pageSize).ceil()}',
                        ),
                        IconButton(
                          onPressed: _page + 1 <
                                  (_changelogFiles.length / _pageSize).ceil()
                              ? () => _setPage(_page + 1)
                              : null,
                          icon: const Icon(Icons.chevron_right),
                          tooltip:
                              MaterialLocalizations.of(context).nextPageTooltip,
                        ),
                      ],
                    ),
                  ),
                )
              else
                const Spacer(),
              FloatingActionButton.extended(
                icon: const Icon(Icons.favorite_outline),
                onPressed: () async {
                  const url = 'https://github.com/sponsors/brandonp2412';
                  await launchUrlString(url);
                },
                label: Text(context.l10n.donate),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
