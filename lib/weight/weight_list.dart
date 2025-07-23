import 'dart:io';

import 'package:fit_book/database/database.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:fit_book/weight/edit_weight_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeightList extends StatefulWidget {
  const WeightList({
    super.key,
    required this.weights,
    required this.selected,
    required this.onSelect,
    required this.onNext,
    required this.ctrl,
  });

  final List<Weight> weights;
  final Set<int> selected;
  final Function(int) onSelect;
  final Function() onNext;
  final ScrollController ctrl;

  @override
  State<WeightList> createState() => _WeightListState();
}

class _WeightListState extends State<WeightList> with WidgetsBindingObserver {
  var now = DateTime.now();

  @override
  void initState() {
    super.initState();
    widget.ctrl.addListener(_scrollListener);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    widget.ctrl.removeListener(_scrollListener);
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed)
      setState(() {
        now = DateTime.now();
      });
  }

  void _scrollListener() {
    if (widget.ctrl.position.pixels <
        widget.ctrl.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8),
        controller: widget.ctrl,
        itemCount: widget.weights.length,
        itemBuilder: (context, index) {
          final weight = widget.weights[index];
          final isToday = isSameDay(weight.created, now);
          Widget? leading;

          if (settings.showImages && weight.image?.isNotEmpty == true)
            leading = Image.file(
              File(weight.image!),
              errorBuilder: (context, error, stackTrace) => TextButton.icon(
                onPressed: () {},
                label: const Text('Image error'),
                icon: const Icon(Icons.error),
              ),
            );

          return Column(
            children: [
              ListTile(
                leading: leading,
                title: Text(
                  "${weight.amount.toStringAsFixed(2)} ${weight.unit}",
                ),
                trailing: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: widget.selected.contains(weight.id) ? 1.0 : 0.0,
                  child: Checkbox(
                    value: widget.selected.contains(weight.id),
                    onChanged: (_) => widget.onSelect(weight.id),
                  ),
                ),
                subtitle: Text(
                  DateFormat(settings.longDateFormat).format(weight.created),
                  style: isToday
                      ? const TextStyle(fontWeight: FontWeight.bold)
                      : null,
                ),
                selected: widget.selected.contains(weight.id),
                onLongPress: () => widget.onSelect(weight.id),
                onTap: () {
                  if (widget.selected.isEmpty)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditWeightPage(
                          weight: weight.toCompanion(false),
                        ),
                      ),
                    );
                  else
                    widget.onSelect(weight.id);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
