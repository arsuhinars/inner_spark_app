import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inner_spark_app/theme.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    super.key,
    required this.titleText,
    required this.descriptionText,
    required this.backgroundProvider,
  });

  final String titleText;
  final String descriptionText;
  final ImageProvider backgroundProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: onBackground,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.secondary,
            strokeAlign: -1.0,
            style: BorderStyle.solid,
            width: 6.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
          child: Row(
            children: [
              Expanded(child: _buildTexts(theme.textTheme)),
              // Image(image: backgroundProvider, alignment: Alignment.centerRight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTexts(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleText, style: textTheme.titleMedium),
        Expanded(
          child: Center(
            child: Text(descriptionText, style: textTheme.bodyMedium),
          ),
        ),
      ],
    );
  }
}
