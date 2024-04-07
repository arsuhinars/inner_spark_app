import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/views/calendar_line.dart';
import 'package:inner_spark_app/widgets/fields/date_range_field.dart';

class MoodView extends StatefulWidget {
  const MoodView({super.key});

  @override
  State<MoodView> createState() => _MoodViewState();
}

class _MoodViewState extends State<MoodView> {
  int _selectedPeriod = 0;
  int _selectedWeekday = 0;
  int _selectedMood = 2;
  final _selectedReasons = [false, false, false, false, false, false, false];
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'main.mood.title'.tr(),
                style: textTheme.titleLarge!.copyWith(
                  color: orangeColor,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  DateRangeField(
                    selectedPeriodIndex: _selectedPeriod,
                    onPeriodChanged: (i) => setState(() => _selectedPeriod = i),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              CalendarLine(
                selectedWeekday: _selectedWeekday,
                onWeekdaySelected: (i) => setState(() => _selectedWeekday = i),
                selectedColor: orangeColor,
              ),
              const SizedBox(height: 16.0),
              Text('main.mood.state_title'.tr(), style: textTheme.titleMedium),
              const SizedBox(height: 8.0),
              Text(
                'main.mood.state_description'.tr(),
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        _MoodPicker(
          moodIndex: _selectedMood,
          onMoodChanged: (i) => _selectedMood = i,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('main.mood.reason_title'.tr(), style: textTheme.titleMedium),
              const SizedBox(height: 8.0),
              Text(
                'main.mood.reason_description'.tr(),
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 8.0),
              _buildReasons(textTheme, theme.colorScheme),
              const SizedBox(height: 16.0),
              Text('main.mood.add_title'.tr(), style: textTheme.titleMedium),
              const SizedBox(height: 8.0),
              Text(
                'main.mood.add_description'.tr(),
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                maxLength: 500,
                decoration: formInputDecoration.copyWith(
                  contentPadding: const EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 8.0),
              OutlinedButton(
                onPressed: () => (),
                style: darkOutlinedButton,
                child: Text('main.mood.record_button'.tr()),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () => (),
                style: FilledButton.styleFrom(
                  backgroundColor: orangeColor,
                  foregroundColor: colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 36.0),
                ),
                child: Text('shared.save'.tr()),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildReasons(TextTheme textTheme, ColorScheme colorScheme) {
    return Wrap(
      spacing: 4.0,
      runSpacing: 4.0,
      children: [
        _buildReasonChip(
          'main.mood.reasons.1'.tr(),
          _selectedReasons[0],
          () => setState(() => _selectedReasons[0] = !_selectedReasons[0]),
          textTheme,
          colorScheme,
        ),
        _buildReasonChip(
          'main.mood.reasons.2'.tr(),
          _selectedReasons[1],
          () => setState(() => _selectedReasons[1] = !_selectedReasons[1]),
          textTheme,
          colorScheme,
        ),
        _buildReasonChip(
          'main.mood.reasons.3'.tr(),
          _selectedReasons[2],
          () => setState(() => _selectedReasons[2] = !_selectedReasons[2]),
          textTheme,
          colorScheme,
        ),
        _buildReasonChip(
          'main.mood.reasons.4'.tr(),
          _selectedReasons[3],
          () => setState(() => _selectedReasons[3] = !_selectedReasons[3]),
          textTheme,
          colorScheme,
        ),
        _buildReasonChip(
          'main.mood.reasons.5'.tr(),
          _selectedReasons[4],
          () => setState(() => _selectedReasons[4] = !_selectedReasons[4]),
          textTheme,
          colorScheme,
        ),
        _buildReasonChip(
          'main.mood.reasons.6'.tr(),
          _selectedReasons[5],
          () => setState(() => _selectedReasons[5] = !_selectedReasons[5]),
          textTheme,
          colorScheme,
        ),
        _buildReasonChip(
          'main.mood.reasons.7'.tr(),
          _selectedReasons[6],
          () => setState(() => _selectedReasons[6] = !_selectedReasons[6]),
          textTheme,
          colorScheme,
        ),
      ],
    );
  }

  Widget _buildReasonChip(
    String label,
    bool isSelected,
    void Function() onSelected,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    final textColor =
        isSelected ? colorScheme.onPrimary : colorScheme.onBackground;

    return FilterChip(
      selected: isSelected,
      selectedColor: orangeColor,
      backgroundColor: onBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(style: BorderStyle.none),
      ),
      showCheckmark: false,
      label: Text(
        label,
        style: textTheme.bodyMedium!.copyWith(color: textColor),
      ),
      onSelected: (b) => onSelected(),
    );
  }
}

class _MoodPicker extends StatefulWidget {
  const _MoodPicker({required this.moodIndex, required this.onMoodChanged});

  final int moodIndex;
  final void Function(int) onMoodChanged;

  @override
  State<_MoodPicker> createState() => _MoodPickerState();
}

class _MoodPickerState extends State<_MoodPicker> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: widget.moodIndex,
    );
  }

  @override
  void didUpdateWidget(_MoodPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_pageController.hasClients) {
      return;
    }

    if (_pageController.page?.round() != widget.moodIndex) {
      _pageController.animateTo(
        widget.moodIndex.toDouble(),
        duration: Durations.short3,
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [colorScheme.secondary, colorScheme.background],
              ),
            ),
          ),
          _buildMoodsView()
        ],
      ),
    );
  }

  Widget _buildMoodsView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (page) {
        setState(() => ());
        widget.onMoodChanged(page);
      },
      padEnds: true,
      children: [
        _buildMoodOption(
          0,
          'assets/images/moods/angry.png',
          'shared.moods.angry'.tr(),
        ),
        _buildMoodOption(
          1,
          'assets/images/moods/sad.png',
          'shared.moods.sad'.tr(),
        ),
        _buildMoodOption(
          2,
          'assets/images/moods/neutral.png',
          'shared.moods.neutral'.tr(),
        ),
        _buildMoodOption(
          3,
          'assets/images/moods/calm.png',
          'shared.moods.calm'.tr(),
        ),
        _buildMoodOption(
          4,
          'assets/images/moods/excited.png',
          'shared.moods.excited'.tr(),
        ),
      ],
    );
  }

  Widget _buildMoodOption(
    int index,
    String image,
    String text,
  ) {
    final bool isSelected;
    if (_pageController.hasClients) {
      isSelected = index == _pageController.page?.round();
    } else {
      isSelected = index == widget.moodIndex;
    }

    return AnimatedScale(
      key: ValueKey(index),
      scale: isSelected ? 1.0 : 0.75,
      duration: Durations.short3,
      child: Center(
        child: SizedBox(
          width: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, alignment: Alignment.topCenter),
              const SizedBox(height: 16.0),
              Text(text, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
