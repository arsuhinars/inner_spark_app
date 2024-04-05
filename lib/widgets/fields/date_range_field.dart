import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';

class DateRangeField extends StatelessWidget {
  const DateRangeField({
    super.key,
    required this.selectedPeriodIndex,
    required this.onPeriodChanged,
  });

  final int selectedPeriodIndex;
  final void Function(int) onPeriodChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: selectedPeriodIndex,
        onChanged: (i) => onPeriodChanged(i!),
        focusColor: onBackground,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        borderRadius: BorderRadius.circular(16.0),
        items: [
          DropdownMenuItem(
            value: 0,
            child: const Text('shared.last_week').tr(),
          ),
          DropdownMenuItem(
            value: 1,
            child: const Text('shared.last_two_weeks').tr(),
          ),
          DropdownMenuItem(
            value: 2,
            child: const Text('shared.last_month').tr(),
          ),
        ],
      ),
    );
  }
}
