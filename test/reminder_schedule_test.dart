import 'package:fit_book/reminder_schedule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final today = DateTime(2026, 11, 19);
  final yesterday = today.subtract(const Duration(days: 1));

  test('generous reminder windows permit multiple inexact background runs', () {
    expect(
      reminderMealAt(DateTime(2026, 11, 19, 8, 0)),
      ReminderMeal.breakfast,
    );
    expect(reminderMealAt(DateTime(2026, 11, 19, 12, 30)), ReminderMeal.lunch);
    expect(reminderMealAt(DateTime(2026, 11, 19, 19, 0)), isNull);
    expect(reminderMealAt(DateTime(2026, 11, 19, 19, 30)), ReminderMeal.dinner);
    expect(reminderMealAt(DateTime(2026, 11, 19, 20, 59)), ReminderMeal.dinner);
    expect(reminderMealAt(DateTime(2026, 11, 19, 21, 0)), isNull);
    expect(reminderCheckInterval, const Duration(minutes: 30));
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

  test('lunch logged at 11:30 counts, even though reminder begins at noon', () {
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
    final now = DateTime(2026, 11, 19, 19, 45);
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
