import 'package:cards_calculator/glob_widgets/app_button.dart';
import 'package:cards_calculator/utils/extensions.dart';
import 'package:flutter/material.dart';

class IncomesEmptyBody extends StatelessWidget {
  const IncomesEmptyBody({super.key, required this.onAddIncomeTap});
  final VoidCallback onAddIncomeTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'ДОХОДЫ',
              style: context.textTheme.displayLarge,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ПОКА НЕТ ИНФОРМАЦИИ О ДОХОДАХ',
                style: context.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'В дальнейшем тут будут отображаться все добавленные вами доходы',
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
          AppButton(
            title: 'ДОБАВИТЬ ДОХОД',
            onTap: onAddIncomeTap,
          ),
        ],
      ),
    );
  }
}
