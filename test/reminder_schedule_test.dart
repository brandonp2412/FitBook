import 'package:fit_book/reminder_schedule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final today = DateTime(2026, 11, 19);
  final yesterday = today.subtract(const Duration(days: 1));

  test('default targets are 9 am, 1 pm and 8 pm local time', () {
    final date = DateTime(2026, 11, 19);
    expect(reminderDefaultTimes[ReminderMeal.breakfast], 9 * 60);
    expect(reminderDefaultTimes[ReminderMeal.lunch], 13 * 60);
    expect(reminderDefaultTimes[ReminderMeal.dinner], 20 * 60);
    for (final (meal, hour) in [
      (ReminderMeal.breakfast, 9),
      (ReminderMeal.lunch, 13),
      (ReminderMeal.dinner, 20),
    ]) {
      expect(
        reminderMealAt(DateTime(date.year, date.month, date.day, hour)),
        meal,
      );
      expect(
        eligibleReminderMealsAt(
          DateTime(date.year, date.month, date.day, hour - 1, 59),
        ).contains(meal),
        isFalse,
      );
      expect(
        eligibleReminderMealsAt(
          DateTime(date.year, date.month, date.day, hour, 59),
        ).contains(meal),
        isTrue,
      );
      expect(
        eligibleReminderMealsAt(
          DateTime(date.year, date.month, date.day, hour + 1),
        ).contains(meal),
        isFalse,
      );
    }
    expect(reminderCheckInterval, const Duration(minutes: 30));
  });

  test('custom time changes eligibility for only the configured meal', () {
    final custom = {
      ReminderMeal.breakfast: 7 * 60 + 45,
      ReminderMeal.lunch: 14 * 60 + 10,
      ReminderMeal.dinner: 21 * 60 + 15,
    };
    expect(
      reminderMealAt(DateTime(2026, 11, 19, 9), reminderTimes: custom),
      isNull,
    );
    expect(
      reminderMealAt(DateTime(2026, 11, 19, 7, 45), reminderTimes: custom),
      ReminderMeal.breakfast,
    );
    expect(
      reminderMealAt(DateTime(2026, 11, 19, 14, 11), reminderTimes: custom),
      ReminderMeal.lunch,
    );
    expect(
      shouldSendMealReminder(
        now: DateTime(2026, 11, 19, 21, 30),
        meal: ReminderMeal.dinner,
        reminderTimes: custom,
        diaryEntries: const [],
      ),
      isTrue,
    );
  });

  test('overlapping custom times evaluate every meal independently', () {
    final times = {
      ReminderMeal.breakfast: 13 * 60,
      ReminderMeal.lunch: 13 * 60,
      ReminderMeal.dinner: 20 * 60,
    };
    expect(
      eligibleReminderMealsAt(
        DateTime(2026, 11, 19, 13, 20),
        reminderTimes: times,
      ).toList(),
      [ReminderMeal.breakfast, ReminderMeal.lunch],
    );
  });

  test('late custom time does not roll over into the following day', () {
    final times = {
      ReminderMeal.dinner: 23 * 60 + 45,
    };
    expect(
      eligibleReminderMealsAt(
        DateTime(2026, 11, 19, 23, 55),
        reminderTimes: times,
      ).contains(ReminderMeal.dinner),
      isTrue,
    );
    expect(
      eligibleReminderMealsAt(
        DateTime(2026, 11, 20, 0, 15),
        reminderTimes: times,
      ).contains(ReminderMeal.dinner),
      isFalse,
    );
  });

  test('yesterday dinner cannot suppress tonight reminder', () {
    final now = DateTime(2026, 11, 19, 20);
    expect(
      shouldSendMealReminder(
        now: now,
        meal: ReminderMeal.dinner,
        diaryEntries: [yesterday.add(const Duration(hours: 20))],
      ),
      isTrue,
    );
  });

  test('today dinner at 7 pm suppresses the 8 pm reminder', () {
    final now = DateTime(2026, 11, 19, 20);
    expect(
      shouldSendMealReminder(
        now: now,
        meal: ReminderMeal.dinner,
        diaryEntries: [today.add(const Duration(hours: 19))],
      ),
      isFalse,
    );
  });

  test('logging dinner at 4 pm also suppresses, breakfast does not', () {
    final now = DateTime(2026, 11, 19, 20);
    expect(
      hasLoggedMealToday(
        ReminderMeal.dinner,
        [today.add(const Duration(hours: 16))],
        now,
      ),
      isTrue,
    );
    expect(
      hasLoggedMealToday(
        ReminderMeal.dinner,
        [today.add(const Duration(hours: 8))],
        now,
      ),
      isFalse,
    );
  });

  test('lunch logged at 11:30 counts, even though reminder begins at 1 pm', () {
    final now = DateTime(2026, 11, 19, 13);
    expect(isLunchDiaryHour(11), isTrue);
    expect(
      shouldSendMealReminder(
        now: now,
        meal: ReminderMeal.lunch,
        diaryEntries: [today.add(const Duration(hours: 11, minutes: 30))],
      ),
      isFalse,
    );
  });

  test('a reminder is sent only once per meal per local day', () {
    final now = DateTime(2026, 11, 19, 20, 45);
    final key = reminderDayKey(ReminderMeal.dinner, now);
    expect(
      shouldSendMealReminder(
        now: now,
        meal: ReminderMeal.dinner,
        diaryEntries: const [],
        lastSentDayKey: key,
      ),
      isFalse,
    );
    expect(
      shouldSendMealReminder(
        now: now.add(const Duration(days: 1)),
        meal: ReminderMeal.dinner,
        diaryEntries: const [],
        lastSentDayKey: key,
      ),
      isTrue,
    );
  });

  test('meal times outside the reminder window cannot notify', () {
    expect(
      shouldSendMealReminder(
        now: DateTime(2026, 11, 19, 22),
        meal: ReminderMeal.dinner,
        diaryEntries: const [],
      ),
      isFalse,
    );
  });

  test('local day comparison rejects previous night across midnight', () {
    expect(
      isSameLocalDay(
        DateTime(2026, 11, 18, 23, 59),
        DateTime(2026, 11, 19, 0),
      ),
      isFalse,
    );
  });
}
