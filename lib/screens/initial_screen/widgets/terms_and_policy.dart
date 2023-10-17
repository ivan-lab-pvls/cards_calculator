import 'package:cards_calculator/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Условия использования  ',
        style: context.textTheme.titleSmall,
        recognizer: TapGestureRecognizer()..onTap = _onTermsTap,
        children: [
          const TextSpan(text: '|'),
          TextSpan(
            text: '  Политика конфиденциальности',
            recognizer: TapGestureRecognizer()..onTap = _onPolicyTap,
          ),
        ],
      ),
    );
  }

  void _onTermsTap() {}

  void _onPolicyTap() {}
}
