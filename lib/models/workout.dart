import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  const Workout._();

  const factory Workout({
    required String titleKey,
    required String descriptionKey,
    required Duration requiredTime,
    required int pointsReward,
    required String backgroundAsset,
    required Color foregroundColor,
    required Color backgroundColor,
  }) = _Workout;
}

@riverpod
Future<List<Workout>> workouts(WorkoutsRef ref) async {
  await Future.delayed(const Duration(milliseconds: 3500));
  return const [
    Workout(
      titleKey: 'shared.workouts.0.title',
      descriptionKey: 'shared.workouts.0.description',
      requiredTime: Duration(minutes: 20),
      pointsReward: 10,
      backgroundAsset: 'assets/images/workouts/workout_1.png',
      foregroundColor: Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Color.fromARGB(255, 148, 187, 195),
    ),
    Workout(
      titleKey: 'shared.workouts.1.title',
      descriptionKey: 'shared.workouts.1.description',
      requiredTime: Duration(minutes: 25),
      pointsReward: 12,
      backgroundAsset: 'assets/images/workouts/workout_2.png',
      foregroundColor: Color.fromARGB(255, 75, 71, 71),
      backgroundColor: Color.fromARGB(255, 222, 234, 185),
    ),
    Workout(
      titleKey: 'shared.workouts.2.title',
      descriptionKey: 'shared.workouts.2.description',
      requiredTime: Duration(minutes: 45),
      pointsReward: 16,
      backgroundAsset: 'assets/images/workouts/workout_3.png',
      foregroundColor: Color.fromARGB(255, 75, 71, 71),
      backgroundColor: Color.fromARGB(255, 231, 231, 231),
    ),
  ];
}
