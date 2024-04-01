import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

class SelectLevelTab extends StatefulWidget {
  const SelectLevelTab({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SelectLevelTabState();
  }
}

class _SelectLevelTabState extends State<SelectLevelTab> {
  int _optionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'tabs.level.title',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge
        ).tr(),
        Expanded(
          child: _buildOptions(theme.textTheme)
        ),
      ]
    );
  }

  Widget _buildOptions(TextTheme textTheme) {
    final leadingTextStyle = textTheme.bodyMedium!.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: darkColor
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
        Iterable.generate(5, (i) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0
            ),
            child: RadioTile(
              value: i,
              groupValue: _optionIndex,
              onChanged: _onOptionChanged,
              child: _buildRadioTileBody(
                '${i + 1}/5',
                leadingTextStyle,
                'tabs.level.level_$i'
              )
            ),
          );
        }).toList()
    );
  }

  Widget _buildRadioTileBody(
    String leadingText, TextStyle leadingTextStyle, String bodyText
  ) {
    return Row(
      children: [
        Text(leadingText, style: leadingTextStyle),
        const SizedBox(width: 16.0),
        Expanded(child: Text(bodyText)),
      ],
    );
  }

  void _onOptionChanged(int? index) {
    setState(() {
      _optionIndex = index ?? 0;
    });
  }
}
