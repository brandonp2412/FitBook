import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/settings/delete_records_button.dart';
import 'package:fit_book/settings/export_data.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FailedMigrationsPage extends StatelessWidget {
  final Object error;

  const FailedMigrationsPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.failedMigrations),
            leading: const Icon(Icons.error),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Text(context.l10n.failedMigrationsDescription),
                ),
                SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    child: ListTile(
                      title: Text(context.l10n.errorMessage),
                      subtitle: Text(error.toString()),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const ExportData(),
                DeleteRecordsButton(pageContext: context),
                TextButton.icon(
                  onPressed: () async {
                    final info = await PackageInfo.fromPlatform();
                    final url = Uri(
                      scheme: 'https',
                      host: 'github.com',
                      path: '/brandonp2412/FitBook/issues/new',
                      queryParameters: {
                        'title': 'Failed migrations',
                        'body': '$error\n${info.version}',
                      },
                    ).toString();

                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    }
                  },
                  label: Text(context.l10n.createIssue),
                  icon: Image.asset(
                    "assets/github-mark.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
