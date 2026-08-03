import 'package:fit_book/diary/diary_food.dart';
import 'package:fit_book/diary/stats.dart';
import 'package:fit_book/main.dart';

class DayGroup {
  DayGroup({required this.day, required this.foods, required this.stats});

  final DateTime day;
  final List<DiaryFood> foods;
  final Stats stats;
}

Stats _statsFor(List<DiaryFood> foods) {
  final stats = Stats(cals: 0, protein: 0, fat: 0, carb: 0, fiber: 0);
  for (final food in foods) {
    stats.cals += food.metrics[db.foods.calories.name] ?? 0;
    stats.protein += food.metrics[db.foods.proteinG.name] ?? 0;
    stats.fat += food.metrics[db.foods.fatG.name] ?? 0;
    stats.carb += food.metrics[db.foods.carbohydrateG.name] ?? 0;
    stats.fiber += food.metrics[db.foods.fiberG.name] ?? 0;
  }
  return stats;
}

/// Assumes [diaryFoods] is already sorted (the diary stream sorts
/// descending by `created`), so entries for the same day are contiguous.
List<DayGroup> groupByDay(List<DiaryFood> diaryFoods) {
  final groups = <DayGroup>[];
  DateTime? currentDay;
  var currentFoods = <DiaryFood>[];

  void flush() {
    final day = currentDay;
    if (day == null) return;
    groups.add(
      DayGroup(day: day, foods: currentFoods, stats: _statsFor(currentFoods)),
    );
  }

  for (final food in diaryFoods) {
    final day =
        DateTime(food.created.year, food.created.month, food.created.day);
    if (currentDay != null && day != currentDay) {
      flush();
      currentFoods = [];
    }
    currentDay = day;
    currentFoods.add(food);
  }
  flush();

  return groups;
}

bool isToday(DateTime day) {
  final now = DateTime.now();
  return day.year == now.year && day.month == now.month && day.day == now.day;
}
