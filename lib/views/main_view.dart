import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/views/main/home_view.dart';
import 'package:inner_spark_app/views/main/mood_view.dart';
import 'package:inner_spark_app/views/main/steps_hydrations_view.dart';
import 'package:inner_spark_app/views/main/store_view.dart';
import 'package:inner_spark_app/views/main/workouts_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(flexibleSpace: const _MainViewAppBar()),
      bottomNavigationBar: _MainViewBottomBar(
        tabIndex: _tabController.index,
        onTabChanged: (tabIndex) => setState(
          () => _tabController.animateTo(tabIndex),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          WorkoutsView(),
          // MeditationsView(),
          StepsHydrationsView(),
          MoodView(),
          StoreView()
        ],
      ),
    );
  }
}

class _MainViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainViewAppBar();

  static const double height = 64.0;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: const SizedBox(
        height: height,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchBar(
            leading: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}

class _MainViewBottomBar extends StatelessWidget {
  const _MainViewBottomBar({
    required this.tabIndex,
    required this.onTabChanged,
  });

  final int tabIndex;
  final void Function(int) onTabChanged;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: tabIndex,
      onDestinationSelected: onTabChanged,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home),
          label: 'main.home_title'.tr(),
        ),
        NavigationDestination(
          icon: const Icon(Icons.fitness_center),
          label: 'main.workouts_title'.tr(),
        ),
        // NavigationDestination(
        //   icon: const Icon(Icons.psychology),
        //   label: 'main.meditations_title'.tr(),
        // ),
        NavigationDestination(
          icon: const Icon(Icons.directions_run),
          label: 'main.steps_hydration_title'.tr(),
        ),
        NavigationDestination(
          icon: const Icon(Icons.mood),
          label: 'main.mood_title'.tr(),
        ),
        NavigationDestination(
          icon: const Icon(Icons.shop),
          label: 'main.store_title'.tr(),
        ),
      ],
    );
  }
}
