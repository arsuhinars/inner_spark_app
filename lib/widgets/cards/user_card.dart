import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserCard extends ConsumerWidget {
  const UserCard({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final user = ref.watch(userNotifierProvider);

    return Skeletonizer(
      enabled: user.isLoading,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: user.hasValue ? onTap : null,
          child: SizedBox(
            height: 72.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: user.valueOrNull?.photo,
                    radius: 24.0,
                  ),
                  const SizedBox(width: 18.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel(user.valueOrNull, theme.textTheme),
                      const SizedBox(height: 4.0),
                      _buildSubLabel(user.valueOrNull)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(User? user, TextTheme textTheme) {
    return Row(
      children: [
        Text('main.user_greet', style: textTheme.bodyLarge!).tr(),
        Text(
          user?.name ?? 'Username',
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget _buildSubLabel(User? user) {
    return Row(
      children: [
        const Skeleton.shade(child: Icon(Icons.bolt)),
        const Text('main.user_points').tr(args: ['${user?.points ?? 100}'])
      ],
    );
  }
}
