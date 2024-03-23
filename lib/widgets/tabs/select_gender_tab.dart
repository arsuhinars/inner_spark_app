import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/widgets/forms/radio_tile.dart';

class SelectGenderTab extends StatefulWidget {
  const SelectGenderTab({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SelectGenderTabState();
  }
}

class _SelectGenderTabState extends State<SelectGenderTab> {
  int _genderIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'signup.gender.title',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge
        ).tr(),
        Expanded(
          child: _buildOptions(theme.colorScheme)
        ),
      ]
    );
  }

  Widget _buildOptions(ColorScheme colorScheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioTile(
          value: 0,
          groupValue: _genderIndex,
          onChanged: _onOptionChanged,
          color: colorScheme.secondary,
          icon: const Icon(Icons.hiking_outlined),
          title: const Text('shared.gender_male').tr(),
        ),
        const SizedBox(height: 8.0),
        RadioTile(
          value: 1,
          groupValue: _genderIndex,
          onChanged: _onOptionChanged,
          color: colorScheme.secondary,
          icon: const Icon(Icons.fitness_center),
          title: const Text('shared.gender_female').tr(),
        ),
      ],
    );
  }

  void _onOptionChanged(int? index) {
    setState(() {
      _genderIndex = index ?? 0;
    });
  }
}
