import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/widgets/forms/radio_tile.dart';

class SelectGoalTab extends StatefulWidget {
  const SelectGoalTab({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SelectGoalTabState();
  }
}

class _SelectGoalTabState extends State<SelectGoalTab> {
  int _optionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'signup.goal.title',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge
        ).tr(),
        Expanded(
          child: _buildOptions()
        ),
      ]
    );
  }

  Widget _buildOptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioTile(
          value: 0,
          groupValue: _optionIndex,
          onChanged: _onOptionChanged,
          icon: const Icon(Icons.hiking_outlined),
          title: const Text('signup.goal.goal_1').tr(),
        ),
        const SizedBox(height: 8.0),
        RadioTile(
          value: 1,
          groupValue: _optionIndex,
          onChanged: _onOptionChanged,
          icon: const Icon(Icons.fitness_center),
          title: const Text('signup.goal.goal_2').tr(),
        ),
        const SizedBox(height: 8.0),
        RadioTile(
          value: 2,
          groupValue: _optionIndex,
          onChanged: _onOptionChanged,
          icon: const Icon(Icons.monitor_weight_outlined),
          title: const Text('signup.goal.goal_3').tr(),
        ),
      ],
    );
  }

  void _onOptionChanged(int? index) {
    setState(() {
      _optionIndex = index ?? 0;
    });
  }
}
