import 'package:fit_book/reminder_schedule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dinner reminders are only eligible from 8 PM until 9 PM', () {
    expect(isDinnerReminderHour(16), isFalse);
    expect(isDinnerReminderHour(20), isTrue);
    expect(isDinnerReminderHour(21), isFalse);
    expect(isDinnerReminderHour(22), isFalse);
    expect(isDinnerReminderHour(23), isFalse);
    expect(isDinnerReminderHour(0), isFalse);
  });

  test('dinner already logged earlier in the evening suppresses reminders', () {
    expect(isDinnerDiaryHour(15), isFalse);
    expect(isDinnerDiaryHour(16), isTrue);
    expect(isDinnerDiaryHour(18), isTrue);
    expect(isDinnerDiaryHour(21), isTrue);
    expect(isDinnerDiaryHour(22), isTrue);
    expect(isDinnerDiaryHour(23), isTrue);
    expect(isDinnerDiaryHour(0), isFalse);
  });
}
