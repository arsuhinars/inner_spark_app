import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/fields/select_age_field.dart';
import 'package:inner_spark_app/widgets/fields/select_gender_field.dart';
import 'package:inner_spark_app/widgets/fields/select_goal_field.dart';
import 'package:inner_spark_app/widgets/fields/select_level_field.dart';
import 'package:inner_spark_app/widgets/fields/select_preferences_field.dart';

class SignupProfileView extends ConsumerStatefulWidget {
  const SignupProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignupProfileViewState();
  }
}

class _SignupProfileViewState extends ConsumerState<SignupProfileView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 5,
      vsync: this,
      animationDuration: Durations.short2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: _onBackButtonPressed,
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildBody() {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(userNotifierProvider);
    final userNotifier = ref.read(userNotifierProvider.notifier);

    return Skeletonizer(
      enabled: user.isLoading,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: user.hasValue
                  ? _buildTabBarView(user.value!, userNotifier)
                  : Bone(borderRadius: BorderRadius.circular(16.0)),
            ),
            const SizedBox(height: 24.0),
            Skeleton.keep(
              child: _SkipContinueButtons(
                onSkipPressed: () => _onSkipPressed(),
                onContinuePressed: () => _onContinuePressed(),
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(
                  controller: _tabController,
                  selectedColor: colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarView(User user, UserNotifier notifier) {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _SignupProfileTab(
          titleText: 'tabs.goal.title'.tr(),
          body: SelectGoalField(
            goal: user.goal,
            onValueChanged: (goal) => notifier.setUser(
              user.copyWith(goal: goal),
            ),
          ),
        ),
        _SignupProfileTab(
          titleText: 'tabs.gender.title'.tr(),
          body: SelectGenderField(
            gender: user.gender,
            onValueChanged: (gender) => notifier.setUser(
              user.copyWith(gender: gender),
            ),
          ),
        ),
        _SignupProfileTab(
          titleText: 'tabs.age.title'.tr(),
          body: SelectAgeField(
            age: user.age,
            onValueChanged: (age) => notifier.setUser(
              user.copyWith(age: age),
            ),
          ),
        ),
        _SignupProfileTab(
          titleText: 'tabs.level.title'.tr(),
          body: SelectLevelField(
            fitnessLevel: user.level,
            onValueChanged: (level) => notifier.setUser(
              user.copyWith(level: level),
            ),
          ),
        ),
        _SignupProfileTab(
          titleText: 'tabs.preferences.title'.tr(),
          body: SelectPreferencesField(
            preference: user.preference,
            onValueChanged: (preference) => notifier.setUser(
              user.copyWith(preference: preference),
            ),
          ),
        ),
      ],
    );
  }

  void _onBackButtonPressed() {
    if (_tabController.index == 0) {
      context.pop();
    } else {
      _tabController.animateTo(_tabController.index - 1);
    }
  }

  void _onSkipPressed() {
    if (_tabController.index == _tabController.length - 1) {
      context.go('/');
    } else {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  void _onContinuePressed() {
    if (_tabController.index == _tabController.length - 1) {
      context.go('/');
    } else {
      _tabController.animateTo(_tabController.index + 1);
    }
  }
}

class _SignupProfileTab extends StatelessWidget {
  const _SignupProfileTab({
    required this.titleText,
    required this.body,
  });

  final String titleText;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          titleText,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
        ),
        Expanded(child: Center(child: body)),
      ],
    );
  }
}

class _SkipContinueButtons extends StatelessWidget {
  const _SkipContinueButtons({
    required this.onSkipPressed,
    required this.onContinuePressed,
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
            TextSpan(children: [
              TextSpan(text: 'shared.skip'.tr()),
              const WidgetSpan(child: SizedBox(width: 8.0)),
              const WidgetSpan(child: Icon(Icons.arrow_forward))
            ]),
          ),
        ),
        const SizedBox(height: 8.0),
        FilledButton(
          onPressed: onContinuePressed,
          style: darkButton,
          child: Text.rich(
            TextSpan(children: [
              TextSpan(text: 'shared.continue'.tr()),
              const WidgetSpan(child: SizedBox(width: 8.0)),
              const WidgetSpan(child: Icon(Icons.arrow_forward))
            ]),
          ),
        ),
      ],
    );
  }
}
