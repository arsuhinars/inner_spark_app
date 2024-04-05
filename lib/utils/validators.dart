import 'package:easy_localization/easy_localization.dart';

final emailRegex = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
const minPasswordLength = 8;

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'validation.empty_field'.tr();
  }

  if (!emailRegex.hasMatch(value)) {
    return 'validation.invalid_email'.tr();
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'validation.empty_field'.tr();
  }

  if (value.length < minPasswordLength) {
    return 'validation.too_short_password'
        .tr(args: [minPasswordLength.toString()]);
  }

  return null;
}

String? nonEmptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'validation.empty_field'.tr();
  }

  return null;
}
