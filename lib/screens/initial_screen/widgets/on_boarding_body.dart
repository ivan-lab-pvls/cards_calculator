import 'package:cards_calculator/glob_widgets/app_button.dart';
import 'package:cards_calculator/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.pageIndex,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Spacer(flex: 2),
          Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(flex: 2),
          Text(
            title,
            style: context.textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            subTitle,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              title: 'Продолжить',
              onTap: onTap,
            ),
          ),
          const SizedBox(height: 12),
          RicePageIndicator(currentIndex: pageIndex),
          const SizedBox(height: 24),
          const TermsAndPolicy(),
          const Spacer(),
        ],
      ),
    );
  }
}
