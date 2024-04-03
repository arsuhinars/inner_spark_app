import 'package:flutter/material.dart';
import 'package:inner_spark_app/models/styles/radio_tile_style.dart';

class RadioTile<T> extends StatelessWidget {
  const RadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.addRadio = true,
    this.style,
    required this.child,
  });

  final Widget child;
  final T value;
  final T? groupValue;
  final void Function(T?) onChanged;
  final bool addRadio;
  final RadioTileStyle? style;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(end: value == groupValue ? 1.0 : 0.0),
      duration: Durations.short1,
      builder: (context, value, child) => _buildMaterial(value, context),
    );
  }

  Widget _buildMaterial(double isSelected, BuildContext context) {
    final style = this.style ?? Theme.of(context).extension<RadioTileStyle>();

    return Material(
      type: MaterialType.card,
      color: Color.lerp(style?.normalColor, style?.selectedColor, isSelected),
      shape: ShapeBorder.lerp(style?.shape, style?.selectedShape, isSelected),
      clipBehavior: Clip.hardEdge,
      child: InkResponse(
        onTap: () => onChanged(value),
        highlightShape: BoxShape.rectangle,
        child: Padding(
          padding: style!.padding,
          child: IconTheme(
            data: IconThemeData.lerp(
              style.iconTheme,
              style.selectedIconTheme,
              isSelected,
            ),
            child: DefaultTextStyle(
              style: TextStyle.lerp(
                style.textStyle,
                style.selectedTextStyle,
                isSelected,
              )!,
              child: _buildBody(style),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(RadioTileStyle style) {
    return Row(children: [
      Expanded(child: child),
      if (addRadio) const SizedBox(width: 8.0),
      if (addRadio)
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: style.radioColor,
        ),
    ]);
  }
}
