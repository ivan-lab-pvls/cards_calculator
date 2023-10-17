import 'package:cards_calculator/constants.dart';
import 'package:cards_calculator/routes.dart';
import 'package:cards_calculator/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/widgets.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late final SharedPreferences _sharedPreferences;
  bool _inited = false;
  final inAppReview = InAppReview.instance;

  @override
  void initState() {
    super.initState();
    _sharedPreferences = context.read<SharedPreferences>();
    _init();
  }

  Future<void> _init() async {
    ratex();
    final isOnBoardingShowed =
        _sharedPreferences.getBool(Constants.isOnBoardingShowedKey) ?? false;

    if (!isOnBoardingShowed) {
      await _sharedPreferences.setBool(Constants.isOnBoardingShowedKey, true);
      setState(() {
        _inited = true;
      });
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.goNamed(Routes.main);
    });
  }

  Future<void> ratex() async {
    bool alreadyRated = _sharedPreferences.getBool('already_rated') ?? false;
    if (!alreadyRated) {
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
        await _sharedPreferences.setBool('already_rated', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _inited
          ? const OnBoarding()
          : Container(
              color: context.theme.primaryColor,
              alignment: Alignment.center,
              child: const Text('КАЛЬКУЛЯТОР КАРТ'),
            ),
    );
  }
}
