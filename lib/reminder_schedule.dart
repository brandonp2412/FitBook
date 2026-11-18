const dinnerReminderStartHour = 20;

// Aim at 8pm and avoid disturbing anyone after the 9pm cutoff.
bool isDinnerReminderHour(int hour) =>
    hour >= dinnerReminderStartHour && hour < 21;

bool isDinnerDiaryHour(int hour) => hour >= 16 && hour < 24;
