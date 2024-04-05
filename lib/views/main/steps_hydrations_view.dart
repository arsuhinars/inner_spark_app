import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inner_spark_app/models/styles/radio_tile_style.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/views/calendar_line.dart';
import 'package:inner_spark_app/widgets/fields/date_range_field.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

class StepsHydrationsView extends StatefulWidget {
  const StepsHydrationsView({super.key});

  @override
  State<StepsHydrationsView> createState() => _StepsHydrationsViewState();
}

class _StepsHydrationsViewState extends State<StepsHydrationsView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  int _selectedWeekday = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TweenAnimationBuilder(
      tween: ColorTween(
          end: _tabController.index == 0
              ? colorScheme.primary
              : colorScheme.secondary),
      duration: Durations.short2,
      builder: _buildBody,
    );
  }

  Widget _buildBody(BuildContext context, Color? value, Widget? child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final radioTextStyle = textTheme.bodyMedium!.copyWith(
      fontWeight: FontWeight.w700,
    );
    final radioTileStyle = primaryRadioTileStyle.copyWith(
      selectedColor: value,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      selectedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ) as RadioTileStyle;

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'main.progress.title'.tr(),
          style: textTheme.titleLarge!.copyWith(
            color: value,
            fontSize: 30.0,
          ),
        ),
        const SizedBox(height: 16.0),
        CalendarLine(
          selectedWeekday: _selectedWeekday,
          onWeekdaySelected: (w) => setState(() => _selectedWeekday = w),
          selectedColor: value,
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStepsTile(radioTileStyle, radioTextStyle, value!),
            _buildHydrationTile(radioTileStyle, radioTextStyle, value)
          ],
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 320.0,
          child: TabBarView(
            controller: _tabController,
            children: const [_StepsView(), _HydrationView()],
          ),
        )
      ],
    );
  }

  Widget _buildStepsTile(
    RadioTileStyle style,
    TextStyle textStyle,
    Color color,
  ) {
    return SizedBox(
      width: 140.0,
      height: 80.0,
      child: RadioTile(
        value: 0,
        groupValue: _tabController.index,
        onChanged: _onTabChanged,
        addRadio: false,
        style: style,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('shared.steps'.tr(), style: textStyle),
                    const SizedBox(height: 4.0),
                    Text('6,035', style: textStyle),
                  ],
                ),
              ),
              const Icon(Icons.directions_walk, size: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHydrationTile(
    RadioTileStyle style,
    TextStyle textStyle,
    Color color,
  ) {
    return SizedBox(
      width: 140.0,
      height: 80.0,
      child: RadioTile(
        value: 1,
        groupValue: _tabController.index,
        onChanged: _onTabChanged,
        addRadio: false,
        style: style,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('shared.water'.tr(), style: textStyle),
                    const SizedBox(height: 4.0),
                    Text(
                      'shared.water_ml'.tr(args: ['500']),
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.water_drop_outlined, size: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabChanged(int? index) {
    if (index != null) {
      setState(() => _tabController.animateTo(index));
    }
  }
}

class _StepsView extends StatelessWidget {
  const _StepsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildHeader(theme.textTheme),
          const SizedBox(height: 8.0),
          _VerticalDiagram(color: theme.colorScheme.primary),
        ],
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('shared.average'.tr(), style: textTheme.titleMedium),
            Text(
              'shared.x_steps'.tr(args: ['5,342']),
              style: textTheme.bodyMedium!.copyWith(fontSize: 18.0),
            )
          ],
        ),
        DateRangeField(selectedPeriodIndex: 0, onPeriodChanged: (i) => ()),
      ],
    );
  }
}

class _HydrationView extends StatelessWidget {
  const _HydrationView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildHeader(theme.textTheme),
          const SizedBox(height: 8.0),
          _VerticalDiagram(color: theme.colorScheme.secondary),
        ],
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('shared.average'.tr(), style: textTheme.titleMedium),
            Text(
              'shared.water_ml'.tr(args: ['1,700']),
              style: textTheme.bodyMedium!.copyWith(fontSize: 18.0),
            )
          ],
        ),
        DateRangeField(selectedPeriodIndex: 0, onPeriodChanged: (i) => ()),
      ],
    );
  }
}

class _VerticalDiagram extends StatelessWidget {
  const _VerticalDiagram({required this.color});

  static final progressValues = [0.6, 0.5, 0.7, 0.8, 0.55, 0.2, 0.3];
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 200.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.onBackground.withAlpha(50),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = -6; i <= 0; ++i)
              _buildColumn(
                DateFormat.E().format(
                  DateTime.now().add(Duration(days: i)),
                ),
                progressValues[i + 6],
              )
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(String label, double progress) {
    return SizedBox(
      height: double.infinity,
      child: FractionallySizedBox(
        heightFactor: progress,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 10.0,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
