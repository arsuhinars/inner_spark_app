// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_tile_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RadioTileStyle {
  Color get normalColor => throw _privateConstructorUsedError;
  Color get selectedColor => throw _privateConstructorUsedError;
  Color get radioColor => throw _privateConstructorUsedError;
  ShapeBorder get shape => throw _privateConstructorUsedError;
  ShapeBorder get selectedShape => throw _privateConstructorUsedError;
  TextStyle get textStyle => throw _privateConstructorUsedError;
  TextStyle get selectedTextStyle => throw _privateConstructorUsedError;
  IconThemeData get iconTheme => throw _privateConstructorUsedError;
  IconThemeData get selectedIconTheme => throw _privateConstructorUsedError;
  EdgeInsetsGeometry get padding => throw _privateConstructorUsedError;
}

/// @nodoc

class _$RadioTileStyleImpl extends _RadioTileStyle {
  const _$RadioTileStyleImpl(
      {required this.normalColor,
      required this.selectedColor,
      required this.radioColor,
      required this.shape,
      required this.selectedShape,
      required this.textStyle,
      required this.selectedTextStyle,
      required this.iconTheme,
      required this.selectedIconTheme,
      required this.padding})
      : super._();

  @override
  final Color normalColor;
  @override
  final Color selectedColor;
  @override
  final Color radioColor;
  @override
  final ShapeBorder shape;
  @override
  final ShapeBorder selectedShape;
  @override
  final TextStyle textStyle;
  @override
  final TextStyle selectedTextStyle;
  @override
  final IconThemeData iconTheme;
  @override
  final IconThemeData selectedIconTheme;
  @override
  final EdgeInsetsGeometry padding;

  @override
  String toString() {
    return 'RadioTileStyle(normalColor: $normalColor, selectedColor: $selectedColor, radioColor: $radioColor, shape: $shape, selectedShape: $selectedShape, textStyle: $textStyle, selectedTextStyle: $selectedTextStyle, iconTheme: $iconTheme, selectedIconTheme: $selectedIconTheme, padding: $padding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioTileStyleImpl &&
            (identical(other.normalColor, normalColor) ||
                other.normalColor == normalColor) &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.radioColor, radioColor) ||
                other.radioColor == radioColor) &&
            (identical(other.shape, shape) || other.shape == shape) &&
            (identical(other.selectedShape, selectedShape) ||
                other.selectedShape == selectedShape) &&
            (identical(other.textStyle, textStyle) ||
                other.textStyle == textStyle) &&
            (identical(other.selectedTextStyle, selectedTextStyle) ||
                other.selectedTextStyle == selectedTextStyle) &&
            (identical(other.iconTheme, iconTheme) ||
                other.iconTheme == iconTheme) &&
            (identical(other.selectedIconTheme, selectedIconTheme) ||
                other.selectedIconTheme == selectedIconTheme) &&
            (identical(other.padding, padding) || other.padding == padding));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      normalColor,
      selectedColor,
      radioColor,
      shape,
      selectedShape,
      textStyle,
      selectedTextStyle,
      iconTheme,
      selectedIconTheme,
      padding);
}

abstract class _RadioTileStyle extends RadioTileStyle {
  const factory _RadioTileStyle(
      {required final Color normalColor,
      required final Color selectedColor,
      required final Color radioColor,
      required final ShapeBorder shape,
      required final ShapeBorder selectedShape,
      required final TextStyle textStyle,
      required final TextStyle selectedTextStyle,
      required final IconThemeData iconTheme,
      required final IconThemeData selectedIconTheme,
      required final EdgeInsetsGeometry padding}) = _$RadioTileStyleImpl;
  const _RadioTileStyle._() : super._();

  @override
  Color get normalColor;
  @override
  Color get selectedColor;
  @override
  Color get radioColor;
  @override
  ShapeBorder get shape;
  @override
  ShapeBorder get selectedShape;
  @override
  TextStyle get textStyle;
  @override
  TextStyle get selectedTextStyle;
  @override
  IconThemeData get iconTheme;
  @override
  IconThemeData get selectedIconTheme;
  @override
  EdgeInsetsGeometry get padding;
}
