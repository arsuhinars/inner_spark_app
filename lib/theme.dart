import 'package:flutter/material.dart';

/* Defines */
const primaryColor = Color.fromARGB(255, 178, 224, 30);
const secondaryColor = Color.fromARGB(255, 200, 187, 243);
const onBackground = Color.fromARGB(255, 237, 237, 237);

/* Flutter theme objects */
final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: primaryColor,
  primary: primaryColor,
  secondary: secondaryColor
);

const textTheme = Typography.blackMountainView;

/* App theme */
final themeData = ThemeData(
  colorScheme: colorScheme,
  textTheme: textTheme
);

/* Buttons style */
final primaryButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.primary,
  foregroundColor: colorScheme.onPrimary,
  padding: const EdgeInsets.symmetric(
    vertical: 18.0, horizontal: 36.0
  )
);
final secondaryButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.secondary,
  foregroundColor: colorScheme.onSecondary,
  padding: const EdgeInsets.symmetric(
    vertical: 18.0, horizontal: 36.0
  )
);
final backgroundButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.background,
  foregroundColor: colorScheme.onBackground,
);
final onBackgroundButton = FilledButton.styleFrom(
  backgroundColor: onBackground,
  foregroundColor: colorScheme.onBackground,
  padding: const EdgeInsets.symmetric(
    vertical: 18.0, horizontal: 36.0
  )
);

/* Text styles */
final titleStyle = textTheme.titleLarge!.copyWith(
  fontSize: 36.0,
  fontWeight: FontWeight.w600
);
final linkStyle = textTheme.bodyMedium!.copyWith(
  color: primaryColor,
  decoration: TextDecoration.underline,
  decorationColor: primaryColor
);

/* Input decorations */
final formInputDecoration = InputDecoration(
  filled: true,
  fillColor: onBackground,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0),
    borderSide: BorderSide.none
  ),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 8.0, horizontal: 16.0
  ),
);
