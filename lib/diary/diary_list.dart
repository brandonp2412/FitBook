import 'package:fit_book/app_search.dart';
import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/diary/diary_variants/swipe_clean.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryList extends StatefulWidget {
  const DiaryList({
    super.key,
    required this.diaryFoods,
    required this.selected,
    required this.onSelect,
    required this.onNext,
    required this.ctrl,
  });

  final List<DiaryFood> diaryFoods;
  final ScrollController ctrl;
  final Set<int> selected;
  final ValueChanged<int> onSelect;
  final VoidCallback onNext;

  @override
  State<DiaryList> createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  @override
  void initState() {
    super.initState();
    widget.ctrl.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.ctrl.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.ctrl.position.pixels <
        widget.ctrl.position.maxScrollExtent - 200) {
      return;
    }
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;

    return Expanded(
      child: SwipeCleanDiary(
        diaryFoods: widget.diaryFoods,
        selected: widget.selected,
        onSelect: widget.onSelect,
        ctrl: widget.ctrl,
        settings: settings,
        topPadding: appSearchHeight,
      ),
    );
  }
}
