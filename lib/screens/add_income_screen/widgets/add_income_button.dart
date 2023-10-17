import 'package:cards_calculator/custom_theme.dart';
import 'package:cards_calculator/utils/extensions.dart';
import 'package:flutter/material.dart';

class AddIncomeButton extends StatelessWidget {
  const AddIncomeButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.buttonEnabledNotifier,
  });

  final VoidCallback onTap;
  final String title;
  final ValueNotifier<bool> buttonEnabledNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: buttonEnabledNotifier,
        builder: (context, value, child) {
          return GestureDetector(
            onTap: value ? onTap : null,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color:
                    value ? CustomTheme.whiteColor : CustomTheme.fontGreyColor,
                borderRadius: BorderRadius.circular(100),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: context.textTheme.labelSmall
                    ?.copyWith(color: CustomTheme.greyColor),
              ),
            ),
          );
        });
  }
}
