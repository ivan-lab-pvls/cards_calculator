import 'package:cards_calculator/data/models/income.dart';
import 'package:cards_calculator/data/models/new.dart';
import 'package:cards_calculator/screens/home_page/home_page.dart';
import 'package:cards_calculator/screens/add_income_screen/add_income_screen.dart';
import 'package:cards_calculator/screens/incomes_screen/incomes_screen.dart';
import 'package:cards_calculator/screens/initial_screen/initial_screen.dart';
import 'package:cards_calculator/screens/main_screen/main_screen.dart';
import 'package:cards_calculator/screens/news_detailed_screen/news_detailed_screen.dart';
import 'package:cards_calculator/screens/news_screen/news_screen.dart';
import 'package:cards_calculator/screens/settings_screen/settings_screen.dart';
import 'package:cards_calculator/screens/u_screen/u_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'coins_saved_data.dart';
import 'coins_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
int minuses = -10;

class Routes {
  static const String initial = '/initial';

  static const String main = '/main';

  static const String incomes = '/incomes';
  static const String addIncome = '/addIncome';

  static const String news = '/news';
  static const String newsDetailed = '/newsDetailed';

  static const String settings = '/settings';
  static const String coins = '/coins';
  static const String u = '/u';

  static GoRouter get routes => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: initial,
        routes: [
          GoRoute(
            path: initial,
            name: initial,
            builder: (context, state) => const InitialScreen(),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) => HomePage(
              child: navigationShell,
            ),
            branches: [
              StatefulShellBranch(
                initialLocation: main,
                routes: [
                  GoRoute(
                    path: main,
                    name: main,
                    builder: (context, state) => const MainScreen(),
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: incomes,
                routes: [
                  GoRoute(
                    path: incomes,
                    name: incomes,
                    builder: (context, state) => const IncomesScreen(),
                  ),
                  GoRoute(
                    path: addIncome,
                    name: addIncome,
                    builder: (context, state) => AddIncomeScreen(
                      income: state.extra as Income?,
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: news,
                routes: [
                  GoRoute(
                    path: news,
                    name: news,
                    builder: (context, state) => const NewsScreen(),
                  ),
                  GoRoute(
                    path: newsDetailed,
                    name: newsDetailed,
                    builder: (context, state) => NewsDetailedScreen(
                      oneNew: state.extra as New,
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: coins,
                routes: [
                  GoRoute(
                    path: coins,
                    name: coins,
                    builder: (context, state) => const CoinsDataPage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: settings,
                routes: [
                  GoRoute(
                    path: settings,
                    name: settings,
                    builder: (context, state) => const SettingsScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: u,
            name: u,
            builder: (context, state) =>
                WatchCardDetailsInSafari(u: state.extra as String? ?? ''),
          ),
        ],
      );
}
