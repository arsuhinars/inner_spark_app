import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/cards/challenge_card.dart';
import 'package:inner_spark_app/widgets/cards/user_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        UserCard(
          onTap: () => (),
        ),
        const _HomeChallengesView(),
        const Divider(indent: 18.0, endIndent: 18.0),
        const _HomeScheduleView()
      ],
    );
  }
}

class _HomeChallengesView extends StatefulWidget {
  const _HomeChallengesView();

  @override
  State<StatefulWidget> createState() {
    return _HomeChallengesViewState();
  }
}

class _HomeChallengesViewState extends State<_HomeChallengesView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'main.home.challenges'.tr(),
            style: textTheme.titleLarge!.copyWith(color: colorScheme.primary),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 178.0,
            child: TabBarView(
              controller: _tabController,
              children: [
                ChallengeCard(
                  titleText: 'shared.challenge.1.title'.tr(),
                  descriptionText: 'shared.challenge.1.description'.tr(),
                  backgroundProvider: const AssetImage(
                    'assets/images/challenges/challenge_1.png',
                  ),
                ),
                ChallengeCard(
                  titleText: 'shared.challenge.2.title'.tr(),
                  descriptionText: 'shared.challenge.2.description'.tr(),
                  backgroundProvider: const AssetImage(
                    'assets/images/challenges/challenge_2.png',
                  ),
                ),
                ChallengeCard(
                  titleText: 'shared.challenge.3.title'.tr(),
                  descriptionText: 'shared.challenge.3.description'.tr(),
                  backgroundProvider: const AssetImage(
                    'assets/images/challenges/challenge_3.png',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Center(
            child: TabPageSelector(
              controller: _tabController,
            ),
          )
        ],
      ),
    );
  }
}

class _HomeScheduleView extends StatefulWidget {
  const _HomeScheduleView();

  @override
  State<_HomeScheduleView> createState() => _HomeScheduleViewState();
}

class _HomeScheduleViewState extends State<_HomeScheduleView> {
  int _selectedPeriodIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [_buildHeadline(theme.textTheme)],
      ),
    );
  }

  Widget _buildHeadline(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('main.home.schedule', style: textTheme.bodyLarge).tr(),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: _selectedPeriodIndex,
            onChanged: (index) => setState(() => _selectedPeriodIndex = index!),
            focusColor: onBackground,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            borderRadius: BorderRadius.circular(16.0),
            items: [
              DropdownMenuItem(
                value: 0,
                child: const Text('shared.last_week').tr(),
              ),
              DropdownMenuItem(
                value: 1,
                child: const Text('shared.last_two_week').tr(),
              ),
              DropdownMenuItem(
                value: 2,
                child: const Text('shared.last_month').tr(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
