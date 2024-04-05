import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/utils/validators.dart';
import 'package:inner_spark_app/widgets/cards/user_card.dart';
import 'package:inner_spark_app/widgets/fields/select_preferences_field.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _UserProfileBody(),
    );
  }
}

class _UserProfileBody extends StatelessWidget {
  const _UserProfileBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        UserCard(),
        _UserProfileGoals(),
        Divider(indent: 18.0, endIndent: 18.0),
        _UserProfileEdit()
      ],
    );
  }
}

class _UserProfileGoals extends StatelessWidget {
  const _UserProfileGoals();

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
            'profile.goals_title'.tr(),
            style: textTheme.titleLarge!.copyWith(color: colorScheme.primary),
          ),
          const SizedBox(height: 8.0),
          _buildGoalCard(
            Icons.fitness_center,
            'profile.goals.1'.tr(),
            () => (),
            colorScheme,
          ),
          _buildGoalCard(
            Icons.directions_walk,
            'profile.goals.2'.tr(),
            () => (),
            colorScheme,
          ),
          _buildGoalCard(
            Icons.water_drop_outlined,
            'profile.goals.3'.tr(),
            () => (),
            colorScheme,
          ),
          _buildGoalCard(
            Icons.psychology,
            'profile.goals.4'.tr(),
            () => (),
            colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildGoalCard(
    IconData icon,
    String label,
    void Function() onEditClicked,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.primary, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12.0),
            Expanded(child: Text(label)),
            IconButton(onPressed: onEditClicked, icon: const Icon(Icons.edit)),
          ],
        ),
      ),
    );
  }
}

class _UserProfileEdit extends ConsumerStatefulWidget {
  const _UserProfileEdit();

  @override
  ConsumerState<_UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends ConsumerState<_UserProfileEdit> {
  final _nameFieldKey = GlobalKey<FormFieldState>();
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();

    _fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final user = ref.watch(userNotifierProvider).valueOrNull;

    final levelTextStyle = textTheme.bodyMedium!
        .copyWith(fontWeight: FontWeight.w700, color: darkColor);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'profile.profile_title'.tr(),
            style: textTheme.titleLarge!.copyWith(color: colorScheme.primary),
          ),
          const SizedBox(height: 16.0),
          Text('shared.name_field_label', style: textTheme.labelMedium).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            key: _nameFieldKey,
            decoration: formInputDecoration.copyWith(),
            controller: _nameController,
            keyboardType: TextInputType.text,
            validator: nonEmptyValidator,
            onChanged: _onNameChanged,
            // onSaved: (v) => _onSignupPressed(context),
          ),
          const SizedBox(height: 16.0),
          Text(
            'shared.fitness_level_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 48.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: FitnessLevel.values
                  .map((level) => _createLevelTile(
                        level,
                        user?.level,
                        levelTextStyle,
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'shared.exercise_preference_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          SelectPreferencesField(
            preference: user?.preference,
            onValueChanged: _onPreferenceChanged,
          ),
        ],
      ),
    );
  }

  Widget _createLevelTile(
    FitnessLevel level,
    FitnessLevel? userLevel,
    TextStyle textStyle,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: 64.0,
        height: 48.0,
        child: RadioTile(
          value: level,
          groupValue: userLevel,
          onChanged: _onLevelChanged,
          addRadio: false,
          child: Text(
            '${level.index + 1}/${FitnessLevel.values.length}',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _fetchUser() async {
    final user = await ref.read(userNotifierProvider.future);
    _nameController.text = user!.name;
  }

  void _onNameChanged(String name) {
    if (_nameFieldKey.currentState!.validate()) {
      final user = ref.read(userNotifierProvider).value;

      ref
          .read(userNotifierProvider.notifier)
          .setUser(user!.copyWith(name: _nameController.text));
    }
  }

  void _onLevelChanged(FitnessLevel? level) {
    final user = ref.read(userNotifierProvider).value;

    ref
        .read(userNotifierProvider.notifier)
        .setUser(user!.copyWith(level: level));
  }

  void _onPreferenceChanged(ExercisePreference? preference) {
    final user = ref.read(userNotifierProvider).value;

    ref
        .read(userNotifierProvider.notifier)
        .setUser(user!.copyWith(preference: preference));
  }
}
