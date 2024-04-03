import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/utils/validators.dart';

class SignupEmailView extends StatelessWidget {
  const SignupEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _SignupEmailViewBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _SignupEmailViewBody extends ConsumerStatefulWidget {
  const _SignupEmailViewBody();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignupEmailViewBodyState();
  }
}

class _SignupEmailViewBodyState extends ConsumerState<_SignupEmailViewBody> {
  final _signupFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'signup_email.title',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
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
          Text('shared.name_field_label', style: textTheme.labelMedium).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: formInputDecoration.copyWith(),
            controller: _nameController,
            keyboardType: TextInputType.text,
            validator: nonEmptyValidator,
            onSaved: (v) => _onSignupPressed(context),
          ),
          const SizedBox(height: 16.0),
          Text('shared.email_field_label', style: textTheme.labelMedium).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: formInputDecoration.copyWith(),
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: emailValidator,
            onSaved: (v) => _onSignupPressed(context),
          ),
          const SizedBox(height: 16.0),
          Text('shared.password_field_label', style: textTheme.labelMedium)
              .tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: formInputDecoration.copyWith(),
            controller: _passwordController,
            obscureText: true,
            validator: passwordValidator,
            onSaved: (v) => _onSignupPressed(context),
          ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: () => _onSignupPressed(context),
            style: primaryButton,
            child: const Text('shared.signup').tr(),
          )
        ],
      ),
    );
  }

  void _onSignupPressed(BuildContext context) {
    if (_signupFormKey.currentState!.validate()) {
      final user = User(
        name: _nameController.text,
        email: _emailController.text,
        points: 100,
      );
      ref.read(userNotifierProvider.notifier).setUser(user);

      context.push('/signup/profile');
    }
  }
}
