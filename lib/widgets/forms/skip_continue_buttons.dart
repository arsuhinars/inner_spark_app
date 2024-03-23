import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';

class SkipContinueButtons extends StatelessWidget {
  const SkipContinueButtons({
    super.key,
    required this.onSkipPressed,
    required this.onContinuePressed
  });

  final void Function() onSkipPressed;
  final void Function() onContinuePressed;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton(
          onPressed: onSkipPressed,
          style: darkOutlinedButton,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'shared.skip'.tr()),
                const WidgetSpan(child: SizedBox(width: 8.0)),
                const WidgetSpan(child: Icon(Icons.arrow_forward))
              ]
            )
          )
        ),
        const SizedBox(height: 8.0),
        FilledButton(
          onPressed: onContinuePressed,
          style: darkButton,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'shared.continue'.tr()),
                const WidgetSpan(child: SizedBox(width: 8.0)),
                const WidgetSpan(child: Icon(Icons.arrow_forward))
              ]
            )
          )
        )
      ],
    );
  }
}
