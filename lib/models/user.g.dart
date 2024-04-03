// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      points: json['points'] as int,
      goal: $enumDecodeNullable(_$UserGoalEnumMap, json['goal']),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      age: json['age'] as int?,
      level: $enumDecodeNullable(_$FitnessLevelEnumMap, json['level']),
      preference:
          $enumDecodeNullable(_$ExercisePreferenceEnumMap, json['preference']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'points': instance.points,
      'goal': _$UserGoalEnumMap[instance.goal],
      'gender': _$GenderEnumMap[instance.gender],
      'age': instance.age,
      'level': _$FitnessLevelEnumMap[instance.level],
      'preference': _$ExercisePreferenceEnumMap[instance.preference],
    };

const _$UserGoalEnumMap = {
  UserGoal.beActive: 'beActive',
  UserGoal.beStrong: 'beStrong',
  UserGoal.loseWeight: 'loseWeight',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};

const _$FitnessLevelEnumMap = {
  FitnessLevel.novice: 'novice',
  FitnessLevel.beginner: 'beginner',
  FitnessLevel.intermediate: 'intermediate',
  FitnessLevel.advanced: 'advanced',
  FitnessLevel.athlete: 'athlete',
};

const _$ExercisePreferenceEnumMap = {
  ExercisePreference.jogging: 'jogging',
  ExercisePreference.walking: 'walking',
  ExercisePreference.weightlift: 'weightlift',
  ExercisePreference.cardio: 'cardio',
  ExercisePreference.yoga: 'yoga',
  ExercisePreference.other: 'other',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userNotifierHash() => r'0bbadee2b74a73d428f9d237c3a6521a673c6410';

/// See also [UserNotifier].
@ProviderFor(UserNotifier)
final userNotifierProvider =
    AsyncNotifierProvider<UserNotifier, User?>.internal(
  UserNotifier.new,
  name: r'userNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserNotifier = AsyncNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
