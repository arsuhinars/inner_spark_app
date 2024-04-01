import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'radio_tile_style.freezed.dart';

@Freezed(copyWith: false)
class RadioTileStyle with _$RadioTileStyle implements ThemeExtension<RadioTileStyle> {
  const RadioTileStyle._();

  const factory RadioTileStyle({
    required final Color normalColor,
    required final Color selectedColor,
    required final Color radioColor,
    required final ShapeBorder shape,
    required final ShapeBorder selectedShape,
    required final TextStyle textStyle,
    required final TextStyle selectedTextStyle,
    required final IconThemeData iconTheme,
    required final IconThemeData selectedIconTheme,
    required final EdgeInsetsGeometry padding
  }) = _RadioTileStyle;
  
  @override
  RadioTileStyle lerp(RadioTileStyle? other, double t) {
    return RadioTileStyle(
      normalColor: Color.lerp(normalColor, other?.normalColor, t)!,
      selectedColor: Color.lerp(selectedColor, other?.selectedColor, t)!,
      radioColor: Color.lerp(radioColor, other?.radioColor, t)!,
      shape: ShapeBorder.lerp(shape, other?.shape, t)!,
      selectedShape: ShapeBorder.lerp(selectedShape, other?.selectedShape, t)!,
      textStyle: TextStyle.lerp(textStyle, other?.textStyle, t)!,
      selectedTextStyle: TextStyle.lerp(selectedTextStyle, other?.selectedTextStyle, t)!,
      iconTheme: IconThemeData.lerp(iconTheme, other?.iconTheme, t),
      selectedIconTheme: IconThemeData.lerp(selectedIconTheme, other?.selectedIconTheme, t),
      padding: EdgeInsetsGeometry.lerp(padding, other?.padding, t)!
    );
  }
  
  @override
  ThemeExtension<RadioTileStyle> copyWith({
    Color? normalColor,
    Color? selectedColor,
    Color? radioColor,
    ShapeBorder? shape,
    ShapeBorder? selectedShape,
    TextStyle? textStyle,
    TextStyle? selectedTextStyle,
    IconThemeData? iconTheme,
    IconThemeData? selectedIconTheme,
    EdgeInsetsGeometry? padding
  }) {
    return RadioTileStyle(
      normalColor: normalColor ?? this.normalColor,
      selectedColor: selectedColor ?? this.selectedColor,
      radioColor: radioColor ?? this.radioColor,
      shape: shape ?? this.shape,
      selectedShape: selectedShape ?? this.selectedShape,
      textStyle: textStyle ?? this.textStyle,
      selectedTextStyle: selectedTextStyle ?? this.selectedTextStyle,
      iconTheme: iconTheme ?? this.iconTheme,
      selectedIconTheme: selectedIconTheme ?? this.selectedIconTheme,
      padding: padding ?? this.padding
    );
  }
  
  @override
  Object get type => RadioTileStyle;
}
