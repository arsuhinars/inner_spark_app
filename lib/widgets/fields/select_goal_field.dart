import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

class SelectGoalField extends StatelessWidget {
  const SelectGoalField({
    super.key,
    required this.goal,
    required this.onValueChanged,
  });

  final UserGoal goal;
  final void Function(UserGoal) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioTile(
          value: UserGoal.beActive,
          groupValue: goal,
          onChanged: (g) => onValueChanged(g!),
          child: _buildRadioTileBody(
            Icons.hiking_outlined,
            'shared.goals.be_active'.tr(),
          ),
        ),
        const SizedBox(height: 8.0),
        RadioTile(
          value: UserGoal.beStrong,
          groupValue: goal,
          onChanged: (g) => onValueChanged(g!),
          child: _buildRadioTileBody(
            Icons.fitness_center,
            'shared.goals.be_strong'.tr(),
          ),
        ),
        const SizedBox(height: 8.0),
        RadioTile(
          value: UserGoal.loseWeight,
          groupValue: goal,
          onChanged: (g) => onValueChanged(g!),
          child: _buildRadioTileBody(
            Icons.monitor_weight_outlined,
            'shared.goals.lose_weight'.tr(),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioTileBody(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8.0),
        Expanded(child: Text(text)),
      ],
    );
  }
}
