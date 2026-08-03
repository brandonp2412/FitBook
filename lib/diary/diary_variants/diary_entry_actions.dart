import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/diary/edit_diary_page.dart';
import 'package:fit_book/quick_add_page.dart';
import 'package:flutter/material.dart';

void openDiaryEntry(
  BuildContext context,
  DiaryFood food,
  Set<int> selected,
  void Function(int) onSelect,
) {
  if (selected.isNotEmpty) {
    onSelect(food.entryId);
    return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => food.name == 'Quick-add'
          ? QuickAddPage(id: food.entryId)
          : EditDiaryPage(id: food.entryId),
    ),
  );
}
