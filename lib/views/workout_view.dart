import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/models/workout.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutView extends ConsumerWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final id = int.parse(GoRouterState.of(context).pathParameters['id']!);
    final workouts = ref.watch(workoutsProvider);

    final workout = workouts.valueOrNull?[id];

    return Scaffold(
      appBar: AppBar(),
      body: Skeletonizer(
        enabled: workouts.isLoading,
        child: ListView(
          children: [
            _buildPreview(workout, theme.textTheme),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton.tonal(
                    style: primaryButton,
                    onPressed: () => (),
                    child: Text('workout.start'.tr()),
                  ),
                  const SizedBox(height: 8.0),
                  OutlinedButton(
                    style: darkOutlinedButton,
                    onPressed: () => (),
                    child: Text('workout.add_to_schedule'.tr()),
                  ),
                  const SizedBox(height: 16.0),
                  Wrap(
                    children: [
                      Chip(
                        avatar: Icon(
                          Icons.timer_outlined,
                          color: theme.colorScheme.onBackground,
                        ),
                        label: Text(
                          'shared.x_minutes'.tr(
                            args: [
                              workout?.requiredTime.inMinutes.toString() ??
                                  '10 min'
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Chip(
                        avatar: Icon(
                          Icons.bolt,
                          color: theme.colorScheme.onBackground,
                        ),
                        label: Text(
                          'shared.x_points'.tr(
                            args: [
                              workout?.pointsReward.toString() ?? '15 points'
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPreview(Workout? workout, TextTheme textTheme) {
    return Container(
      height: 340.0,
      color: workout?.backgroundColor ?? onBackground,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (workout != null)
            Image.asset(
              workout.backgroundAsset,
              alignment: Alignment.bottomRight,
            ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  workout != null ? workout.titleKey.tr() : 'Example title',
                  style: textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: workout?.foregroundColor,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  workout != null ? workout.descriptionKey.tr() : 'Sample text',
                  style: textTheme.bodyMedium!.copyWith(
                    color: workout?.foregroundColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
