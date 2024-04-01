import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/utils/validators.dart';

class SignupEmailView extends StatelessWidget {
  const SignupEmailView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _SignupEmailViewBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _SignupEmailViewBody extends StatelessWidget {
  _SignupEmailViewBody();

  final _signupFormKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0, vertical: 16.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'signup_email.title',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge
          ).tr(),
          _buildForm(context, textTheme),
          Text(
            'shared.terms_of_service_agreement',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ).tr()
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, TextTheme textTheme) {
    return Form(
      key: _signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'shared.name_field_label',
            style: textTheme.labelMedium
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: formInputDecoration.copyWith(),
            keyboardType: TextInputType.text,
            validator: nonEmptyValidator,
          ),
          const SizedBox(height: 16.0),
          Text(
            'shared.email_field_label',
            style: textTheme.labelMedium
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: formInputDecoration.copyWith(),
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
          ),
          const SizedBox(height: 16.0),
          Text(
            'shared.password_field_label',
            style: textTheme.labelMedium
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: formInputDecoration.copyWith(),
            obscureText: true,
            validator: passwordValidator,
          ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: () => _onSignupPressed(context),
            style: primaryButton,
            child: const Text('shared.signup').tr()
          )
        ],
      )
    );
  }

  void _onSignupPressed(BuildContext context) {
    if (_signupFormKey.currentState!.validate()) {
      context.push('/signup/profile');
    }
  }
}
