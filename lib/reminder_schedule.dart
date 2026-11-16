const dinnerReminderStartHour = 22;

bool isDinnerReminderHour(int hour) =>
    hour >= dinnerReminderStartHour && hour < 24;

bool isDinnerDiaryHour(int hour) => hour >= 16 && hour < 24;
