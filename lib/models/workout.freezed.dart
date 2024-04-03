// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Workout {
  String get titleKey => throw _privateConstructorUsedError;
  String get descriptionKey => throw _privateConstructorUsedError;
  Duration get requiredTime => throw _privateConstructorUsedError;
  int get pointsReward => throw _privateConstructorUsedError;
  String get backgroundAsset => throw _privateConstructorUsedError;
  Color get foregroundColor => throw _privateConstructorUsedError;
  Color get backgroundColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call(
      {String titleKey,
      String descriptionKey,
      Duration requiredTime,
      int pointsReward,
      String backgroundAsset,
      Color foregroundColor,
      Color backgroundColor});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? requiredTime = null,
    Object? pointsReward = null,
    Object? backgroundAsset = null,
    Object? foregroundColor = null,
    Object? backgroundColor = null,
  }) {
    return _then(_value.copyWith(
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      requiredTime: null == requiredTime
          ? _value.requiredTime
          : requiredTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundAsset: null == backgroundAsset
          ? _value.backgroundAsset
          : backgroundAsset // ignore: cast_nullable_to_non_nullable
              as String,
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
          _$WorkoutImpl value, $Res Function(_$WorkoutImpl) then) =
      __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String titleKey,
      String descriptionKey,
      Duration requiredTime,
      int pointsReward,
      String backgroundAsset,
      Color foregroundColor,
      Color backgroundColor});
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
      _$WorkoutImpl _value, $Res Function(_$WorkoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? requiredTime = null,
    Object? pointsReward = null,
    Object? backgroundAsset = null,
    Object? foregroundColor = null,
    Object? backgroundColor = null,
  }) {
    return _then(_$WorkoutImpl(
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      requiredTime: null == requiredTime
          ? _value.requiredTime
          : requiredTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundAsset: null == backgroundAsset
          ? _value.backgroundAsset
          : backgroundAsset // ignore: cast_nullable_to_non_nullable
              as String,
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$WorkoutImpl extends _Workout {
  const _$WorkoutImpl(
      {required this.titleKey,
      required this.descriptionKey,
      required this.requiredTime,
      required this.pointsReward,
      required this.backgroundAsset,
      required this.foregroundColor,
      required this.backgroundColor})
      : super._();

  @override
  final String titleKey;
  @override
  final String descriptionKey;
  @override
  final Duration requiredTime;
  @override
  final int pointsReward;
  @override
  final String backgroundAsset;
  @override
  final Color foregroundColor;
  @override
  final Color backgroundColor;

  @override
  String toString() {
    return 'Workout(titleKey: $titleKey, descriptionKey: $descriptionKey, requiredTime: $requiredTime, pointsReward: $pointsReward, backgroundAsset: $backgroundAsset, foregroundColor: $foregroundColor, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.titleKey, titleKey) ||
                other.titleKey == titleKey) &&
            (identical(other.descriptionKey, descriptionKey) ||
                other.descriptionKey == descriptionKey) &&
            (identical(other.requiredTime, requiredTime) ||
                other.requiredTime == requiredTime) &&
            (identical(other.pointsReward, pointsReward) ||
                other.pointsReward == pointsReward) &&
            (identical(other.backgroundAsset, backgroundAsset) ||
                other.backgroundAsset == backgroundAsset) &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      titleKey,
      descriptionKey,
      requiredTime,
      pointsReward,
      backgroundAsset,
      foregroundColor,
      backgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);
}

abstract class _Workout extends Workout {
  const factory _Workout(
      {required final String titleKey,
      required final String descriptionKey,
      required final Duration requiredTime,
      required final int pointsReward,
      required final String backgroundAsset,
      required final Color foregroundColor,
      required final Color backgroundColor}) = _$WorkoutImpl;
  const _Workout._() : super._();

  @override
  String get titleKey;
  @override
  String get descriptionKey;
  @override
  Duration get requiredTime;
  @override
  int get pointsReward;
  @override
  String get backgroundAsset;
  @override
  Color get foregroundColor;
  @override
  Color get backgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
