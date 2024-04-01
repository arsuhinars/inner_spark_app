import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/models/styles/radio_tile_style.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

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
          'tabs.gender.title',
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
    final radioTileStyle = secondaryRadioTileStyle.copyWith(
      textStyle: secondaryRadioTileStyle.textStyle.copyWith(
        fontSize: 18.0
      ),
      selectedTextStyle: secondaryRadioTileStyle.selectedTextStyle.copyWith(
        fontSize: 18.0
      ),
      iconTheme: secondaryRadioTileStyle.iconTheme.copyWith(
        size: 36.0
      ),
      selectedIconTheme: secondaryRadioTileStyle.selectedIconTheme.copyWith(
        size: 36.0
      )
    ) as RadioTileStyle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioTile(
          value: 0,
          groupValue: _genderIndex,
          onChanged: _onOptionChanged,
          addRadio: false,
          style: radioTileStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.female),
              const SizedBox(height: 4.0),
              const Text('tabs.gender.female').tr()
            ]
          ),
        ),
        const SizedBox(height: 8.0),
        RadioTile(
          value: 1,
          groupValue: _genderIndex,
          onChanged: _onOptionChanged,
          addRadio: false,
          style: radioTileStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.male),
              const SizedBox(height: 4.0),
              const Text('tabs.gender.male').tr()
            ]
          ),
        )
      ],
    );
  }

  void _onOptionChanged(int? index) {
    setState(() {
      _genderIndex = index ?? 0;
    });
  }
}
