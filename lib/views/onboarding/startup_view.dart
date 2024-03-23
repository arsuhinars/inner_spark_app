import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/theme.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _StartupViewBody()
    );
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
          colors: [
            colorScheme.secondary, colorScheme.background
          ]
        )
      ),
    );
  }

  Widget _buildContent(BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 80.0, horizontal: 16.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              'startup.title', style: titleStyle
            ).tr(),
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
  static const swipeDelay = 5.0;

  int _currentPage = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        if (_pageController.page != null) {
          _currentPage = _pageController.page!.round();
        }
      });
    });

    _timer = Timer.periodic(
      Duration(milliseconds: (swipeDelay * 1000.0).floor()),
      (_) => setState(() {
        _pageController.animateToPage(
          (_currentPage + 1) % tipsCount,
          duration: Durations.short3,
          curve: Curves.ease
        );
      })
    );
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
            height: 128.0,
            child: PageView.builder(
              itemCount: tipsCount,
              controller: _pageController,
              itemBuilder: (context, index) => _buildTip(index, theme.textTheme),
            )
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Iterable.generate(
              tipsCount, (i) => _buildTipIndicator(i, theme.colorScheme)
            ).toList(),
          )
      ],
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
          style: textTheme.bodyMedium
        ).tr()
      ],
    );
  }

  Widget _buildTipIndicator(int index, ColorScheme colorScheme) {
    return AnimatedSwitcher(
      duration: Durations.short3,
      child: TabPageSelectorIndicator(
        key: ValueKey((index, _currentPage == index)),
        backgroundColor: (
          _currentPage == index ?
          colorScheme.background :
          Colors.transparent
        ),
        borderColor: colorScheme.background,
        size: 12.0,
      ),
    );
  }
}
