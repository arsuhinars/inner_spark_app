import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SelectAgeField extends StatelessWidget {
  const SelectAgeField({
    super.key,
    required this.age,
    this.defaultAge = 18,
    required this.onValueChanged,
  });

  final int? age;
  final int defaultAge;
  final void Function(int) onValueChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return NumberPicker(
      minValue: 14,
      maxValue: 99,
      itemCount: 5,
      textStyle: theme.textTheme.bodyMedium!.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
      ),
      selectedTextStyle: theme.textTheme.bodyMedium!.copyWith(
        fontSize: 32.0,
        color: theme.colorScheme.primary,
      ),
      value: age ?? defaultAge,
      onChanged: onValueChanged,
    );
  }
}
