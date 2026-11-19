/// Meal reminder eligibility is shared by Android, iOS and desktop.
/// These windows are intentionally broad: background work is best-effort.
enum ReminderMeal { breakfast, lunch, dinner }

const reminderCheckInterval = Duration(minutes: 30);

bool isBreakfastDiaryHour(int hour) => hour >= 6 && hour < 12;
bool isLunchDiaryHour(int hour) => hour >= 11 && hour < 16;
bool isDinnerDiaryHour(int hour) => hour >= 16 && hour < 24;

/// User-configurable reminder time, expressed as minutes past local midnight.
/// Defaults: breakfast 9:00, lunch 13:00, dinner 20:00.
const reminderDefaultTimes = <ReminderMeal, int>{
  ReminderMeal.breakfast: 9 * 60,
  ReminderMeal.lunch: 13 * 60,
  ReminderMeal.dinner: 20 * 60,
};

const reminderDeliveryWindow = Duration(minutes: 60);

/// All eligible meals, since users may set two reminders to the same time.
/// We never spill yesterday's reminders into today after midnight.
Iterable<ReminderMeal> eligibleReminderMealsAt(
  DateTime now, {
  Map<ReminderMeal, int> reminderTimes = reminderDefaultTimes,
}) sync* {
  final minutes = now.hour * 60 + now.minute;
  for (final meal in ReminderMeal.values) {
    final start = reminderTimes[meal] ?? reminderDefaultTimes[meal]!;
    if (start < 0 || start >= 24 * 60) continue;
    if (minutes >= start &&
        minutes < start + reminderDeliveryWindow.inMinutes) {
      yield meal;
    }
  }
}

/// Retained for existing callers needing the first active meal.
ReminderMeal? reminderMealAt(
  DateTime now, {
  Map<ReminderMeal, int> reminderTimes = reminderDefaultTimes,
}) {
  for (final meal
      in eligibleReminderMealsAt(now, reminderTimes: reminderTimes)) {
    return meal;
  }
  return null;
}

bool isSameLocalDay(DateTime a, DateTime b) {
  final left = a.toLocal();
  final right = b.toLocal();
  return left.year == right.year &&
      left.month == right.month &&
      left.day == right.day;
}

bool hasLoggedMealToday(
  ReminderMeal meal,
  Iterable<DateTime> diaryEntries,
  DateTime now,
) {
  return diaryEntries.any((createdAt) {
    final entry = createdAt.toLocal();
    if (!isSameLocalDay(entry, now)) return false;
    return switch (meal) {
      ReminderMeal.breakfast => isBreakfastDiaryHour(entry.hour),
      ReminderMeal.lunch => isLunchDiaryHour(entry.hour),
      ReminderMeal.dinner => isDinnerDiaryHour(entry.hour),
    };
  });
}

/// A stable per-day key, independent of the clock time the worker happens to run.
String reminderDayKey(ReminderMeal meal, DateTime now) {
  final local = now.toLocal();
  String two(int value) => value.toString().padLeft(2, '0');
  return '${meal.name}:${local.year}-${two(local.month)}-${two(local.day)}';
}

bool shouldSendMealReminder({
  required DateTime now,
  required ReminderMeal meal,
  required Iterable<DateTime> diaryEntries,
  String? lastSentDayKey,
  Map<ReminderMeal, int> reminderTimes = reminderDefaultTimes,
}) {
  return eligibleReminderMealsAt(now, reminderTimes: reminderTimes)
          .contains(meal) &&
      !hasLoggedMealToday(meal, diaryEntries, now) &&
      lastSentDayKey != reminderDayKey(meal, now);
}
