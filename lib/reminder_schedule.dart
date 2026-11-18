/// Meal reminder eligibility is shared by Android, iOS and desktop.
/// These windows are intentionally broad: background work is best-effort.
enum ReminderMeal { breakfast, lunch, dinner }

const reminderCheckInterval = Duration(minutes: 30);

bool isBreakfastDiaryHour(int hour) => hour >= 6 && hour < 12;
bool isLunchDiaryHour(int hour) => hour >= 11 && hour < 16;
bool isDinnerDiaryHour(int hour) => hour >= 16 && hour < 24;

bool isLunchReminderHour(int hour) => hour >= 12 && hour < 16;
bool isDinnerReminderHour(int hour) => hour >= 19 && hour < 21;

bool isDinnerReminderTime(DateTime now) =>
    (now.hour == 19 && now.minute >= 30) || now.hour == 20;

ReminderMeal? reminderMealAt(DateTime now) {
  if (now.hour >= 8 && now.hour < 12) return ReminderMeal.breakfast;
  if (isLunchReminderHour(now.hour)) return ReminderMeal.lunch;
  if (isDinnerReminderTime(now)) return ReminderMeal.dinner;
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
}) {
  return reminderMealAt(now) == meal &&
      !hasLoggedMealToday(meal, diaryEntries, now) &&
      lastSentDayKey != reminderDayKey(meal, now);
}
