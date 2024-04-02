import 'package:flutter/material.dart';

enum Gender { male, female }

enum UserGoal { beActive, beStrong, loseWeight }

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
