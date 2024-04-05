import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalendarLine extends StatelessWidget {
  const CalendarLine(
      {super.key,
      required this.selectedWeekday,
      required this.onWeekdaySelected,
      this.selectedColor});

  final int selectedWeekday;
  final void Function(int) onWeekdaySelected;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 56.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = -2; i < 3; ++i)
            _buildDayChip(
              DateTime.now().add(Duration(days: i)),
              i == selectedWeekday,
              theme.textTheme,
              theme.colorScheme,
              (b) {
                if (b) {
                  onWeekdaySelected(i);
                }
              },
            )
        ],
      ),
    );
  }

  Widget _buildDayChip(
    DateTime date,
    bool isSelected,
    TextTheme textTheme,
    ColorScheme colorScheme,
    void Function(bool) onSelected,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ChoiceChip(
        selected: isSelected,
        showCheckmark: false,
        onSelected: onSelected,
        selectedColor: selectedColor ?? colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Text(
                date.day.toString(),
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(DateFormat.E().format(date))
            ],
          ),
        ),
      ),
    );
  }
}
