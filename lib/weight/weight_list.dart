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
  });

  final List<Weight> weights;
  final Set<int> selected;
  final Function(int) onSelect;
  final Function() onNext;

  @override
  State<WeightList> createState() => _WeightListState();
}

class _WeightListState extends State<WeightList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels <
        _scrollController.position.maxScrollExtent - 200) return;
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.weights.length,
        itemBuilder: (context, index) {
          final weight = widget.weights[index];
          final isToday = isSameDay(weight.created, DateTime.now());

          return Column(
            children: [
              ListTile(
                title: Text(
                  "${weight.amount} ${weight.unit}",
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
                          weight: weight,
                          lastWeight: widget.weights.first,
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
