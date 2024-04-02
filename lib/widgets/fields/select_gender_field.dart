import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/models/styles/radio_tile_style.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

class SelectGenderField extends StatelessWidget {
  const SelectGenderField({
    super.key,
    required this.gender,
    required this.onValueChanged,
  });

  final Gender gender;
  final void Function(Gender) onValueChanged;

  @override
  Widget build(BuildContext context) {
    final radioTileStyle = secondaryRadioTileStyle.copyWith(
      textStyle: secondaryRadioTileStyle.textStyle.copyWith(
        fontSize: 18.0,
      ),
      selectedTextStyle: secondaryRadioTileStyle.selectedTextStyle.copyWith(
        fontSize: 18.0,
      ),
      iconTheme: secondaryRadioTileStyle.iconTheme.copyWith(
        size: 36.0,
      ),
      selectedIconTheme: secondaryRadioTileStyle.selectedIconTheme.copyWith(
        size: 36.0,
      ),
    ) as RadioTileStyle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioTile(
          value: Gender.female,
          groupValue: gender,
          onChanged: (g) => onValueChanged(g!),
          addRadio: false,
          style: radioTileStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.female),
              const SizedBox(height: 4.0),
              const Text('shared.gender_female').tr()
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        RadioTile(
          value: Gender.male,
          groupValue: gender,
          onChanged: (g) => onValueChanged(g!),
          addRadio: false,
          style: radioTileStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.male),
              const SizedBox(height: 4.0),
              const Text('shared.gender_male').tr()
            ],
          ),
        ),
      ],
    );
  }
}
