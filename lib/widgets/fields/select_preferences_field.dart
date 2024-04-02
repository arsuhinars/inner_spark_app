import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

class SelectPreferencesField extends StatelessWidget {
  const SelectPreferencesField({
    super.key,
    required this.preference,
    required this.onValueChanged,
  });

  final ExercisePreference preference;
  final void Function(ExercisePreference) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(16.0),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      children: ExercisePreference.values.map(_buildRadioTile).toList(),
    );
  }

  Widget _buildRadioTile(ExercisePreference currPreference) {
    return RadioTile(
      value: currPreference,
      groupValue: preference,
      onChanged: (p) => onValueChanged(p!),
      addRadio: false,
      style: secondaryRadioTileStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(currPreference.icon, size: 24.0),
          const SizedBox(height: 4.0),
          Text(
            currPreference.translationKey.tr(),
            textAlign: TextAlign.center,
          ).tr(),
        ],
      ),
    );
  }
}
