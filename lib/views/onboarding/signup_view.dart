import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/theme.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _SignupViewBody(),
    );
  }
}

class _SignupViewBody extends StatelessWidget {
  const _SignupViewBody();
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(theme.colorScheme),
        _buildContent(context, theme.textTheme, theme.colorScheme)
      ],
    );
  }

  Widget _buildBackground(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.secondary, colorScheme.background
          ]
        )
      ),
    );
  }

  Widget _buildContent(BuildContext context, textTheme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 80.0, horizontal: 24.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitleText(textTheme),
          _buildButtons(context),
          _buildAlreadySignupText(context, textTheme, colorScheme)
        ]
      ),
    );
  }

  Widget _buildTitleText(TextTheme textTheme) {
    final span = TextSpan(
      children: [
        TextSpan(
          text: 'signup.title_1'.tr(),
          style: titleStyle.copyWith(
            fontWeight: FontWeight.w300
          )
        ),
        TextSpan(
          text: '\n${'signup.title_2'.tr()}', style: titleStyle
        )
      ]
    );

    return Text.rich(span, textAlign: TextAlign.center);
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton(
          onPressed: () => _onSignupByPhonePressed(context),
          style: onBackgroundButton,
          child: Text.rich(
            TextSpan(children: [
              const WidgetSpan(child: Icon(Icons.phone_outlined)),
              const WidgetSpan(child: SizedBox(width: 8.0)),
              TextSpan(text: 'shared.signup_phone'.tr())
            ])
          ),
        ),
        const SizedBox(height: 10.0),
        FilledButton(
          onPressed: () => _onSignupByEmailPressed(context),
          style: onBackgroundButton,
          child: Text.rich(
            TextSpan(children: [
              const WidgetSpan(child: Icon(Icons.mail_outlined)),
              const WidgetSpan(child: SizedBox(width: 8.0)),
              TextSpan(text: 'shared.signup_email'.tr())
            ])
          ),
        ),
        const SizedBox(height: 10.0),
        FilledButton(
          onPressed: () => _onSignupByGooglePressed(context),
          style: onBackgroundButton,
          child: Text.rich(
            TextSpan(children: [
              const WidgetSpan(child: Icon(Icons.login_outlined)),
              const WidgetSpan(child: SizedBox(width: 8.0)),
              TextSpan(text: 'shared.signup_google'.tr())
            ])
          ),
        )
      ],
    );
  }

  Widget _buildAlreadySignupText(BuildContext context, textTheme, ColorScheme colorScheme) {
    return Column(
      children: [
        const Text('signup.already_signup').tr(),
        InkWell(
          onTap: () => _onLoginPressed(context),
          child: Text('shared.login', style: linkStyle).tr()
        )
      ],
    );
  }

  void _onSignupByPhonePressed(BuildContext context) {
    context.push('/signup/phone');
  }

  void _onSignupByEmailPressed(BuildContext context) {
    context.push('/signup/email');
  }

  void _onSignupByGooglePressed(BuildContext context) {
    context.push('/signup/google');
  }

  void _onLoginPressed(BuildContext context) {
    context.push('/login');
  }
}
