import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';

class RadioTile<T> extends StatelessWidget {
  const RadioTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Color? color,
  }) : color = color ?? primaryColor;

  final Widget icon;
  final Widget title;
  final T value;
  final T groupValue;
  final void Function(T?) onChanged;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(end: value == groupValue ? 1.0 : 0.0),
      duration: Durations.short1,
      builder: (context, value, child) => _buildMaterial(value)
    );
  }

  Widget _buildMaterial(double isSelected) {
    final borderSide = BorderSide(
      color: color,
      strokeAlign: 0.0,
      style: BorderStyle.solid,
      width: 6.0 * isSelected
    );
    
    return Material(
      type: MaterialType.card,
      color: Color.lerp(onBackground, onBackground.withAlpha(0), isSelected),
      shape: RoundedRectangleBorder(
        side: BorderSide.lerp(
          borderSide.copyWith(style: BorderStyle.none),
          borderSide, isSelected
        ),
        borderRadius: BorderRadius.circular(16.0)
      ),
      clipBehavior: Clip.hardEdge,
      child: InkResponse(
        onTap: () => onChanged(value),
        highlightShape: BoxShape.rectangle,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 16.0
          ),
          child: _buildBody()
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Row(
      children: [
        icon,
        const SizedBox(width: 8.0),
        Expanded(child: title),
        const SizedBox(width: 8.0),
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: color,
        )
      ],
    );
  }
}
