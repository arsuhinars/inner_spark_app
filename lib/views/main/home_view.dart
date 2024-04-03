import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
        const _HomeChallengesView()
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
