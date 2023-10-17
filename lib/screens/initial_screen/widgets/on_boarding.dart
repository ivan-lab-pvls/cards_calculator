import 'package:cards_calculator/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();

  void _onNextTap() => _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );

  void _onLastPageTap() => context.goNamed(Routes.main);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnBoardingBody(
                imagePath: 'assets/on_boarding/on_boarding_1.png',
                title: 'Контролируйте ваш банковский счет',
                subTitle:
                    'Основная информация о вашем счете, включая баланс, расходы, основные новости',
                onTap: _onNextTap,
                pageIndex: 0,
              ),
              OnBoardingBody(
                imagePath: 'assets/on_boarding/on_boarding_2.png',
                title: 'Мы очень ценим ваши отзывы',
                subTitle:
                    'Каждый день мы становимся лучше благодаря вашим оценкам и отзывам - это помогает нам!',
                onTap: _onNextTap,
                pageIndex: 1,
              ),
              OnBoardingBody(
                imagePath: 'assets/on_boarding/on_boarding_3.png',
                title: 'Ведите свой дневник доходов',
                subTitle:
                    'Легко добавляйте информацию о своих доходах и держите их всегда под рукой',
                onTap: _onLastPageTap,
                pageIndex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
