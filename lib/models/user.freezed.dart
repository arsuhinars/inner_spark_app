// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  UserGoal? get goal => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  FitnessLevel? get level => throw _privateConstructorUsedError;
  ExercisePreference? get preference => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String name,
      String email,
      int points,
      UserGoal? goal,
      Gender? gender,
      int? age,
      FitnessLevel? level,
      ExercisePreference? preference});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? points = null,
    Object? goal = freezed,
    Object? gender = freezed,
    Object? age = freezed,
    Object? level = freezed,
    Object? preference = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as FitnessLevel?,
      preference: freezed == preference
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as ExercisePreference?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      int points,
      UserGoal? goal,
      Gender? gender,
      int? age,
      FitnessLevel? level,
      ExercisePreference? preference});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? points = null,
    Object? goal = freezed,
    Object? gender = freezed,
    Object? age = freezed,
    Object? level = freezed,
    Object? preference = freezed,
  }) {
    return _then(_$UserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as FitnessLevel?,
      preference: freezed == preference
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as ExercisePreference?,
    ));
  }
}

/// @nodoc

class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.name,
      required this.email,
      required this.points,
      this.goal,
      this.gender,
      this.age,
      this.level,
      this.preference});

  @override
  final String name;
  @override
  final String email;
  @override
  final int points;
  @override
  final UserGoal? goal;
  @override
  final Gender? gender;
  @override
  final int? age;
  @override
  final FitnessLevel? level;
  @override
  final ExercisePreference? preference;

  @override
  String toString() {
    return 'User(name: $name, email: $email, points: $points, goal: $goal, gender: $gender, age: $age, level: $level, preference: $preference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.preference, preference) ||
                other.preference == preference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, email, points, goal, gender, age, level, preference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {required final String name,
      required final String email,
      required final int points,
      final UserGoal? goal,
      final Gender? gender,
      final int? age,
      final FitnessLevel? level,
      final ExercisePreference? preference}) = _$UserImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  int get points;
  @override
  UserGoal? get goal;
  @override
  Gender? get gender;
  @override
  int? get age;
  @override
  FitnessLevel? get level;
  @override
  ExercisePreference? get preference;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
