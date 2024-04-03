import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum Gender {
  male('shared.gender_male', Icons.male),
  female('shared.gender_female', Icons.female);

  const Gender(this.translationKey, this.icon);

  final String translationKey;
  final IconData icon;
}

enum UserGoal {
  beActive('shared.goals.be_active', Icons.hiking_outlined),
  beStrong('shared.goals.be_strong', Icons.fitness_center),
  loseWeight('shared.goals.lose_weight', Icons.monitor_weight_outlined);

  const UserGoal(this.translationKey, this.icon);

  final String translationKey;
  final IconData icon;
}

enum FitnessLevel {
  novice('shared.fitness_levels.novice'),
  beginner('shared.fitness_levels.beginner'),
  intermediate('shared.fitness_levels.intermediate'),
  advanced('shared.fitness_levels.advanced'),
  athlete('shared.fitness_levels.athlete');

  const FitnessLevel(this.translationKey);

  final String translationKey;
}

enum ExercisePreference {
  jogging('shared.exercise_preferences.jogging', Icons.directions_run),
  walking('shared.exercise_preferences.walking', Icons.directions_walk),
  weightlift('shared.exercise_preferences.weightlift', Icons.fitness_center),
  cardio('shared.exercise_preferences.cardio', Icons.monitor_heart_outlined),
  yoga('shared.exercise_preferences.yoga', Icons.self_improvement),
  other('shared.exercise_preferences.other', Icons.settings);

  const ExercisePreference(this.translationKey, this.icon);

  final String translationKey;
  final IconData icon;
}

@freezed
class User with _$User {
  const factory User({
    required String name,
    required String email,
    required int points,
    UserGoal? goal,
    Gender? gender,
    int? age,
    FitnessLevel? level,
    ExercisePreference? preference,
  }) = _User;
}

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  User? build() => null;

  void update(User? user) {
    state = user;
  }
}
