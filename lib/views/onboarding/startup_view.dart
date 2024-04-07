import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/page_indicators.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _StartupViewBody());
  }
}

class _StartupViewBody extends StatelessWidget {
  const _StartupViewBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(theme.colorScheme),
        _buildImage(),
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
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [colorScheme.secondary, colorScheme.background],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/startup_background.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text('startup.title', style: titleStyle).tr(),
          ),
          const _StartupViewTips(),
          const SizedBox(height: 64.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                style: backgroundButton,
                onPressed: () => _onLoginPressed(context),
                child: const Text('shared.login').tr(),
              ),
              const SizedBox(width: 16.0),
              FilledButton(
                style: backgroundButton,
                onPressed: () => _onSignupPressed(context),
                child: const Text('shared.signup').tr(),
              )
            ],
          )
        ],
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    context.push('/login');
  }

  void _onSignupPressed(BuildContext context) {
    context.push('/signup');
  }
}

class _StartupViewTips extends StatefulWidget {
  const _StartupViewTips();

  @override
  State<StatefulWidget> createState() {
    return _StartupViewTipsState();
  }
}

class _StartupViewTipsState extends State<_StartupViewTips> {
  static const tipsCount = 3;

  int _currentTip = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        if (_pageController.page != null) {
          _currentTip = _pageController.page!.round();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        _buildTipsContainer(theme.textTheme),
        const SizedBox(height: 8.0),
        PageIndicators(
          pagesCount: tipsCount,
          page: _currentTip,
          color: theme.colorScheme.background,
        )
      ],
    );
  }

  Widget _buildTipsContainer(TextTheme textTheme) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 176.0,
          decoration: BoxDecoration(
            color: darkColor.withAlpha(20),
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: PageView.builder(
            itemCount: tipsCount,
            controller: _pageController,
            itemBuilder: (context, index) => _buildTip(index, textTheme),
          ),
        ),
      ),
    );
  }

  Widget _buildTip(int index, TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'startup.tips.$index.title',
          style: textTheme.titleMedium,
        ).tr(),
        Text(
          'startup.tips.$index.body',
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium,
        ).tr()
      ],
    );
  }
}
