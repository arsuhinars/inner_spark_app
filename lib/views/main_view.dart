import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _MainViewAppBar(),
    );
  }
}

class _MainViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainViewAppBar();

  static const double height = 48.0;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SearchBar(
          leading: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}

class _MainViewBottomBar extends StatelessWidget {
  const _MainViewBottomBar({required this.tabIndex});

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: tabIndex,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.fitness_center),
          label: 'home.workouts_title'.tr(),
        ),
        NavigationDestination(
          icon: const Icon(Icons.human),
          label: 'home.workouts_title'.tr(),
        ),
      ],
    );
  }
}
