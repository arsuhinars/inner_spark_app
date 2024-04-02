import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:inner_spark_app/widgets/fields/select_age_field.dart';
import 'package:inner_spark_app/widgets/fields/select_gender_field.dart';
import 'package:inner_spark_app/widgets/fields/select_goal_field.dart';
import 'package:inner_spark_app/widgets/fields/select_level_field.dart';
import 'package:inner_spark_app/widgets/fields/select_preferences_field.dart';
import 'package:inner_spark_app/widgets/skip_continue_buttons.dart';

class SignupProfileView extends StatefulWidget {
  const SignupProfileView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupProfileViewState();
  }
}

class _SignupProfileViewState extends State<SignupProfileView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  var _goal = UserGoal.beActive;
  var _gender = Gender.female;
  var _age = 18;
  var _level = FitnessLevel.novice;
  var _preference = ExercisePreference.jogging;

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

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _buildTabBarView()),
          SkipContinueButtons(
            onSkipPressed: () => _onSkipPressed(),
            onContinuePressed: () => _onContinuePressed(),
          ),
          const SizedBox(height: 24.0),
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
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _SignupProfileTab(
          titleText: 'tabs.goal.title'.tr(),
          body: SelectGoalField(
            goal: _goal,
            onValueChanged: (goal) => setState(() => _goal = goal),
          ),
        ),
        _SignupProfileTab(
          titleText: 'tabs.gender.title'.tr(),
          body: SelectGenderField(
            gender: _gender,
            onValueChanged: (gender) => setState(() => _gender = gender),
          ),
        ),
        _SignupProfileTab(
          titleText: 'tabs.age.title'.tr(),
          body: SelectAgeField(
            age: _age,
            onValueChanged: (age) => setState(() => _age = age),
          ),
        ),
        _SignupProfileTab(
          titleText: 'tabs.level.title'.tr(),
          body: SelectLevelField(
            fitnessLevel: _level,
            onValueChanged: (level) => setState(() => _level = level),
          ),
        ),
        _SignupProfileTab(
          titleText: 'tabs.preferences.title'.tr(),
          body: SelectPreferencesField(
            preference: _preference,
            onValueChanged: (preference) => setState(
              () => _preference = preference,
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
      // TODO: save results
    } else {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  void _onContinuePressed() {
    if (_tabController.index == _tabController.length - 1) {
      // TODO: save results
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
