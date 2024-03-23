import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/utils/validators.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _LoginViewBody(),
    );
  }
}

class _LoginViewBody extends StatelessWidget {
  _LoginViewBody();

  final _loginFormKey = GlobalKey<FormState>();
  
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
            'login.title',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge
          ).tr(),
          _buildForm(textTheme),
          Text(
            'shared.terms_of_service_agreement',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ).tr()
        ],
      ),
    );
  }

  Widget _buildForm(TextTheme textTheme) {
    return Form(
      key: _loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
            onPressed: () => _onLoginPressed(),
            style: secondaryButton,
            child: const Text('shared.login').tr()
          )
        ],
      )
    );
  }

  void _onLoginPressed() {
    _loginFormKey.currentState!.validate();
  }
}
