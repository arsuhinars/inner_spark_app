import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/models/workout.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.workout,
    required this.onTap,
  });

  static const height = 150.0;

  final Workout? workout;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final workout = this.workout;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Skeletonizer(
        enabled: workout == null,
        child: SizedBox(
          height: height,
          child: Material(
            color: workout?.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: workout != null
                ? InkResponse(
                    onTap: onTap,
                    highlightShape: BoxShape.rectangle,
                    child: _buildBody(workout, theme.textTheme),
                  )
                : const Bone(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(Workout workout, TextTheme textTheme) {
    final bodyMedium = textTheme.bodyMedium!.copyWith(
      color: workout.foregroundColor,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(workout.backgroundAsset, alignment: Alignment.centerRight),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200.0,
                child: Text(
                  workout.titleKey.tr(),
                  style: textTheme.titleMedium!.copyWith(
                    color: workout.foregroundColor,
                  ),
                ),
              ),
              Text(workout.descriptionKey.tr(), style: bodyMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Chip(
                    avatar: Icon(
                      Icons.timer_outlined,
                      color: workout.foregroundColor,
                    ),
                    label: Text(
                      'shared.x_minutes'.tr(
                        args: [workout.requiredTime.inMinutes.toString()],
                      ),
                      style: bodyMedium,
                    ),
                    backgroundColor: workout.backgroundColor,
                    side: BorderSide(color: workout.foregroundColor),
                  ),
                  const SizedBox(width: 4.0),
                  Chip(
                    avatar: Icon(
                      Icons.bolt,
                      color: workout.foregroundColor,
                    ),
                    label: Text(
                      'shared.x_points'.tr(
                        args: [workout.pointsReward.toString()],
                      ),
                      style: bodyMedium,
                    ),
                    backgroundColor: workout.backgroundColor,
                    side: BorderSide(color: workout.foregroundColor),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
