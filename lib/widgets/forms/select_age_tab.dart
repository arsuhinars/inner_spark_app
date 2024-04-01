import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SelectAgeTab extends StatefulWidget {
  const SelectAgeTab({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SelectAgeTabState();
  }
}

class _SelectAgeTabState extends State<SelectAgeTab> {
  int _age = 18;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'tabs.age.title',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge
        ).tr(),
        Expanded(
          child: Center(
            child: NumberPicker(
              minValue: 10,
              maxValue: 99,
              itemCount: 5,
              textStyle: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.w400
              ),
              selectedTextStyle: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 32.0,
                color: theme.colorScheme.primary
              ),
              value: _age,
              onChanged: _onAgeChanged,
            ),
          )
        ),
      ]
    );
  }

  void _onAgeChanged(int value) {
    setState(() {
      _age = value;
    });
  }
}
