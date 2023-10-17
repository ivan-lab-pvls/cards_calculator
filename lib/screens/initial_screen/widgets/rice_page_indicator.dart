import 'package:cards_calculator/custom_theme.dart';
import 'package:flutter/material.dart';

class RicePageIndicator extends StatelessWidget {
  const RicePageIndicator({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) => Container(
          margin: EdgeInsets.only(right: index < 2 ? 6 : 0),
          height: 3,
          width: 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: index <= currentIndex
                ? CustomTheme.blackColor
                : CustomTheme.lightGreyColor,
          ),
        ),
      ),
    );
  }
}
