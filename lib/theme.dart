import 'package:flutter/material.dart';
import 'package:inner_spark_app/models/styles/radio_tile_style.dart';

/* Defines */
const primaryColor = Color.fromARGB(255, 178, 224, 30);
const secondaryColor = Color.fromARGB(255, 200, 187, 243);
const onBackground = Color.fromARGB(255, 237, 237, 237);
const darkColor = Color.fromARGB(255, 75, 71, 71);
const orangeColor = Color.fromARGB(255, 229, 191, 41);

/* Flutter theme objects */
final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: primaryColor,
  primary: primaryColor,
  secondary: secondaryColor,
  surfaceTint: onBackground,
);

/* Text styles */
const textTheme = Typography.blackMountainView;

final darkTextStyle = textTheme.bodyMedium!.copyWith(color: darkColor);

/* Icon themes */
const iconTheme = IconThemeData(color: Colors.black);
const darkIconTheme = IconThemeData(color: darkColor);

/* Radio tile styles */
final primaryRadioTileStyle = RadioTileStyle(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  normalColor: onBackground,
  selectedColor: onBackground.withAlpha(0),
  radioColor: primaryColor,
  textStyle: darkTextStyle,
  selectedTextStyle: darkTextStyle,
  iconTheme: darkIconTheme,
  selectedIconTheme: darkIconTheme,
  shape: RoundedRectangleBorder(
    side: const BorderSide(
      color: primaryColor,
      width: 0.0,
      style: BorderStyle.none,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
    borderRadius: BorderRadius.circular(16.0),
  ),
  selectedShape: RoundedRectangleBorder(
    side: const BorderSide(
      color: primaryColor,
      width: 6.0,
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
    borderRadius: BorderRadius.circular(16.0),
  ),
);
final secondaryRadioTileStyle = RadioTileStyle(
  padding: const EdgeInsets.all(8.0),
  normalColor: onBackground,
  selectedColor: secondaryColor,
  radioColor: darkColor,
  textStyle: darkTextStyle,
  selectedTextStyle: darkTextStyle.copyWith(color: colorScheme.onSecondary),
  iconTheme: darkIconTheme,
  selectedIconTheme: iconTheme.copyWith(color: Colors.white),
  shape: RoundedRectangleBorder(
    side: const BorderSide(style: BorderStyle.none),
    borderRadius: BorderRadius.circular(16.0),
  ),
  selectedShape: RoundedRectangleBorder(
    side: const BorderSide(style: BorderStyle.none),
    borderRadius: BorderRadius.circular(16.0),
  ),
);

/* Buttons style */
final primaryButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.primary,
  foregroundColor: colorScheme.onPrimary,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0),
);
final secondaryButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.secondary,
  foregroundColor: colorScheme.onSecondary,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0),
);
final backgroundButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.background,
  foregroundColor: colorScheme.onBackground,
);
final onBackgroundButton = FilledButton.styleFrom(
  backgroundColor: onBackground,
  foregroundColor: colorScheme.onBackground,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0),
);
final darkButton = FilledButton.styleFrom(
  backgroundColor: darkColor,
  foregroundColor: colorScheme.onPrimary,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0),
);
final darkOutlinedButton = OutlinedButton.styleFrom(
  foregroundColor: darkColor,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0),
);

/* Text styles */
final titleStyle = textTheme.titleLarge!.copyWith(
  fontSize: 36.0,
  fontWeight: FontWeight.w600,
);
final linkStyle = textTheme.bodyMedium!.copyWith(
  color: primaryColor,
  decoration: TextDecoration.underline,
  decorationColor: primaryColor,
);

/* Input decorations */
final formInputDecoration = InputDecoration(
  filled: true,
  fillColor: onBackground,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0),
    borderSide: BorderSide.none,
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
);

/* App theme */
final themeData = ThemeData(
  colorScheme: colorScheme,
  textTheme: textTheme,
  iconTheme: iconTheme,
  extensions: [primaryRadioTileStyle],
);
