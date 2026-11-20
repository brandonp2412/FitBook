import 'package:fit_book/bottom_nav.dart';
import 'package:fit_book/diary/diary_stats_utils.dart';
import 'package:fit_book/l10n/l10n.dart';
import 'package:fit_book/settings/settings_state.dart';
import 'package:fit_book/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Detailed daily nutrition totals, including nutrients without configured goals.
class NutritionDetailsPage extends StatelessWidget {
  const NutritionDetailsPage({super.key, required this.day});

  final DayGroup day;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>().value;
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    Widget nutrient({
      required String name,
      required double current,
      required int? goal,
      required String unit,
      required IconData icon,
      required Color color,
    }) {
      final hasGoal = goal != null && goal > 0;
      final value = formatDisplayNumber(
        context,
        current,
        maximumFractionDigits: unit == 'kcal' ? 0 : 1,
      );
      final target = hasGoal
          ? formatDisplayNumber(context, goal, maximumFractionDigits: 0)
          : null;

      return Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                hasGoal
                    ? l10n.diarySummaryDivisionValue(value, target!, unit)
                    : '$value $unit',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              if (hasGoal) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    value: (current / goal).clamp(0.0, 1.0),
                    minHeight: 8,
                    backgroundColor: colors.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.diarySummaryRemainingValue(
                    formatDisplayNumber(
                      context,
                      goal - current,
                      maximumFractionDigits: unit == 'kcal' ? 0 : 1,
                    ),
                    unit,
                  ),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ] else
                Text(
                  '${l10n.goal}: ${l10n.notSet}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.nutritionDetails)),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                navigationBottomClearance(context) + 16,
              ),
              children: [
                Text(
                  isToday(day.day)
                      ? l10n.todayProgress
                      : formatDisplayDate(
                          context,
                          day.day,
                          settings.shortDateFormat,
                        ),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.loggedEntries(day.foods.length),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                nutrient(
                  name: l10n.calories,
                  current: day.stats.cals,
                  goal: settings.dailyCalories,
                  unit: 'kcal',
                  icon: Icons.local_fire_department_outlined,
                  color: colors.primary,
                ),
                const SizedBox(height: 12),
                nutrient(
                  name: l10n.protein,
                  current: day.stats.protein,
                  goal: settings.dailyProtein,
                  unit: 'g',
                  icon: Icons.fitness_center_outlined,
                  color: colors.secondary,
                ),
                const SizedBox(height: 12),
                nutrient(
                  name: l10n.carbs,
                  current: day.stats.carb,
                  goal: settings.dailyCarb,
                  unit: 'g',
                  icon: Icons.grain_outlined,
                  color: colors.tertiary,
                ),
                const SizedBox(height: 12),
                nutrient(
                  name: l10n.fat,
                  current: day.stats.fat,
                  goal: settings.dailyFat,
                  unit: 'g',
                  icon: Icons.water_drop_outlined,
                  color: colors.onSurfaceVariant,
                ),
                const SizedBox(height: 12),
                nutrient(
                  name: l10n.fiber,
                  current: day.stats.fiber,
                  goal: settings.dailyFiber,
                  unit: 'g',
                  icon: Icons.spa_outlined,
                  color: colors.secondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
