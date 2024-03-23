import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    super.key,
    required this.pagesCount,
    required this.page,
    Color? color
  }) : color = color ?? primaryColor;
  
  final int pagesCount;
  final int page;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: Iterable.generate(pagesCount, _buildIndicator).toList(),
    );
  }

  Widget _buildIndicator(int index) {
    return AnimatedSwitcher(
      duration: Durations.short3,
      child: TabPageSelectorIndicator(
        key: ValueKey((index, index == page)),
        backgroundColor: (
          index == page ?
          color :
          Colors.transparent
        ),
        borderColor: color,
        borderStyle: BorderStyle.solid,
        size: 12.0,
      ),
    );
  }
}
