import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

class SelectPreferencesTab extends StatefulWidget {
  const SelectPreferencesTab({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SelectPreferencesTabState();
  }
}

class _SelectPreferencesTabState extends State<SelectPreferencesTab> {
  int _optionIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'tabs.preferences.title',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge
        ).tr(),
        Expanded(
          child: Center(
            child: _buildOptions()
          )
        ),
      ]
    );
  }

  Widget _buildOptions() {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(16.0),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      children: [
        _buildRadioTile(0, Icons.directions_run),
        _buildRadioTile(1, Icons.directions_walk),
        _buildRadioTile(2, Icons.fitness_center),
        _buildRadioTile(3, Icons.monitor_heart_outlined),
        _buildRadioTile(4, Icons.self_improvement),
        _buildRadioTile(5, Icons.settings),
      ],
    );
  }

  Widget _buildRadioTile(
    int index, IconData icon
  ) {
    return RadioTile(
      value: index,
      groupValue: _optionIndex,
      onChanged: _onOptionChanged,
      addRadio: false,
      style: secondaryRadioTileStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 24.0),
          const SizedBox(height: 4.0),
          Text(
            'tabs.preferences.option_$index', textAlign: TextAlign.center,
          ).tr()
        ]
      )
    );
  }

  void _onOptionChanged(int? index) {
    setState(() {
      _optionIndex = index ?? 0;
    });
  }
}
