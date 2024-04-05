import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/models/workout.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/cards/workout_card.dart';

class WorkoutsView extends StatefulWidget {
  const WorkoutsView({super.key});

  @override
  State<WorkoutsView> createState() => _WorkoutsViewState();
}

class _WorkoutsViewState extends State<WorkoutsView> {
  bool _areFiltersVisible = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      children: [
        _buildFilterButton(),
        const SizedBox(height: 8.0),
        if (_areFiltersVisible) const _WorkoutsFilters(),
        const SizedBox(height: 16.0),
        const _WorkoutsViewList(),
      ],
    );
  }

  Widget _buildFilterButton() {
    return FilledButton.tonal(
      onPressed: () => setState(() => _areFiltersVisible = !_areFiltersVisible),
      style: primaryButton,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'main.workouts.filter'.tr(),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(_areFiltersVisible ? Icons.expand_less : Icons.expand_more)
        ],
      ),
    );
  }
}

class _WorkoutsFilters extends StatefulWidget {
  const _WorkoutsFilters();

  @override
  State<_WorkoutsFilters> createState() => _WorkoutsFiltersState();
}

class _WorkoutsFiltersState extends State<_WorkoutsFilters> {
  int _workoutTypeFilter = 0;
  int _pointsFilter = 0;
  int _bodyPartsFilter = 0;
  double _durationFilter = 20.0;
  int _sortType = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ..._buildWorkoutsFilter(textTheme, theme.colorScheme),
        ..._buildPointsFilter(textTheme, theme.colorScheme),
        ..._buildBodyPartsFilter(textTheme, theme.colorScheme),
        ..._buildDurationFilter(textTheme),
        ..._buildSortSelector(textTheme, colorScheme),
      ],
    );
  }

  Iterable<Widget> _buildWorkoutsFilter(
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return [
      Text(
        'main.workouts.workout_type_filter'.tr(),
        style: textTheme.labelMedium,
      ),
      SizedBox(
        height: 48.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildFilterChip(
              const ValueKey(0),
              Icons.fitness_center,
              'main.workouts.workouts_types.weightlift'.tr(),
              _workoutTypeFilter == 0,
              () => setState(() => _workoutTypeFilter = 0),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(1),
              Icons.self_improvement,
              'main.workouts.workouts_types.yoga'.tr(),
              _workoutTypeFilter == 1,
              () => setState(() => _workoutTypeFilter = 1),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(2),
              Icons.monitor_heart_outlined,
              'main.workouts.workouts_types.cardio'.tr(),
              _workoutTypeFilter == 2,
              () => setState(() => _workoutTypeFilter = 2),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(3),
              Icons.directions_run,
              'main.workouts.workouts_types.jogging'.tr(),
              _workoutTypeFilter == 3,
              () => setState(() => _workoutTypeFilter = 3),
              textTheme,
              colorScheme,
            ),
          ],
        ),
      )
    ];
  }

  Iterable<Widget> _buildPointsFilter(
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return [
      Text(
        'main.workouts.points_filter'.tr(),
        style: textTheme.labelMedium,
      ),
      SizedBox(
        height: 48.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildFilterChip(
              const ValueKey(0),
              Icons.bolt,
              'main.workouts.points_label'.tr(args: ['5']),
              _pointsFilter == 0,
              () => setState(() => _pointsFilter = 0),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(1),
              Icons.bolt,
              'main.workouts.points_label'.tr(args: ['10']),
              _pointsFilter == 1,
              () => setState(() => _pointsFilter = 1),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(2),
              Icons.bolt,
              'main.workouts.points_label'.tr(args: ['15']),
              _pointsFilter == 2,
              () => setState(() => _pointsFilter = 2),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(3),
              Icons.bolt,
              'main.workouts.points_label'.tr(args: ['20']),
              _pointsFilter == 3,
              () => setState(() => _pointsFilter = 3),
              textTheme,
              colorScheme,
            ),
          ],
        ),
      )
    ];
  }

  Iterable<Widget> _buildBodyPartsFilter(
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return [
      Text(
        'main.workouts.body_parts_filter'.tr(),
        style: textTheme.labelMedium,
      ),
      SizedBox(
        height: 48.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildFilterChip(
              const ValueKey(0),
              null,
              'main.workouts.body_parts.upper_body'.tr(),
              _bodyPartsFilter == 0,
              () => setState(() => _bodyPartsFilter = 0),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(1),
              null,
              'main.workouts.body_parts.lower_body'.tr(),
              _bodyPartsFilter == 1,
              () => setState(() => _bodyPartsFilter = 1),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(2),
              null,
              'main.workouts.body_parts.full_body'.tr(),
              _bodyPartsFilter == 2,
              () => setState(() => _bodyPartsFilter = 2),
              textTheme,
              colorScheme,
            ),
          ],
        ),
      )
    ];
  }

  Iterable<Widget> _buildDurationFilter(TextTheme textTheme) {
    return [
      Text(
        'main.workouts.duration_filter'.tr(),
        style: textTheme.labelMedium,
      ),
      Slider(
        divisions: 10,
        value: _durationFilter,
        min: 10.0,
        max: 60.0,
        label: _durationFilter.round().toString(),
        onChanged: (value) => setState(() => _durationFilter = value),
      )
    ];
  }

  Iterable<Widget> _buildSortSelector(
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return [
      Text(
        'main.workouts.sort_type'.tr(),
        style: textTheme.labelMedium,
      ),
      SizedBox(
        height: 48.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildFilterChip(
              const ValueKey(0),
              null,
              'main.workouts.sort.latest'.tr(),
              _sortType == 0,
              () => setState(() => _sortType = 0),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(1),
              null,
              'main.workouts.sort.popular'.tr(),
              _sortType == 1,
              () => setState(() => _sortType = 1),
              textTheme,
              colorScheme,
            ),
            _buildFilterChip(
              const ValueKey(2),
              null,
              'main.workouts.sort.oldest'.tr(),
              _sortType == 2,
              () => setState(() => _sortType = 2),
              textTheme,
              colorScheme,
            ),
          ],
        ),
      )
    ];
  }

  Widget _buildFilterChip(
    ValueKey? key,
    IconData? icon,
    String label,
    bool isSelected,
    void Function() onSelected,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    final textColor =
        isSelected ? colorScheme.onPrimary : colorScheme.onBackground;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FilterChip(
        key: key,
        selected: isSelected,
        selectedColor: colorScheme.primary,
        backgroundColor: onBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(style: BorderStyle.none),
        ),
        showCheckmark: false,
        label: Row(
          children: [
            if (icon != null) Icon(icon, color: textColor),
            Text(
              label,
              style: textTheme.bodyMedium!.copyWith(color: textColor),
            ),
          ],
        ),
        onSelected: (b) => onSelected(),
      ),
    );
  }
}

class _WorkoutsViewList extends ConsumerWidget {
  const _WorkoutsViewList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    final workouts = ref.watch(workoutsProvider);
    final workoutsList = workouts.valueOrNull ?? <Workout?>[null, null, null];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'main.home.recommendations'.tr(),
          style: titleStyle,
        ),
        for (var (i, w) in workoutsList.indexed)
          WorkoutCard(
            workout: w,
            onTap: () => context.push('/workout/$i'),
          )
      ],
    );
  }
}
