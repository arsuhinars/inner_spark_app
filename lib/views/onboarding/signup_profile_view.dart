import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/widgets/forms/select_age_tab.dart';
import 'package:inner_spark_app/widgets/forms/select_gender_tab.dart';
import 'package:inner_spark_app/widgets/forms/select_goal_tab.dart';
import 'package:inner_spark_app/widgets/forms/select_preferences_tab.dart';
import 'package:inner_spark_app/widgets/skip_continue_buttons.dart';
import 'package:inner_spark_app/widgets/forms/select_level_tab.dart';

class SignupProfileView extends StatefulWidget {
  const SignupProfileView({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SignupProfileViewState();
  }
}

class _SignupProfileViewState extends State<SignupProfileView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 5, vsync: this, animationDuration: Durations.short2
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
        icon: const Icon(Icons.arrow_back)
      ),
    );
  }
  
  Widget _buildBody() {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16.0, 48.0, 16.0, 24.0
      ),
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
                selectedColor: colorScheme.primary
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        SelectGoalTab(),
        SelectGenderTab(),
        SelectAgeTab(),
        SelectLevelTab(),
        SelectPreferencesTab()
      ]
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
