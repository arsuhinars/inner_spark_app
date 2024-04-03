import 'package:flutter/material.dart';
import 'package:inner_spark_app/widgets/user_card.dart';

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
      ],
    );
  }
}
