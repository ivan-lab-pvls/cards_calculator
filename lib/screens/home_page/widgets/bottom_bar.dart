import 'package:cards_calculator/screens/home_page/widgets/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });

  final int currentIndex;
  final void Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 8,
      ),
      child: Row(
        children: [
          BottomBarItem(
            onTap: () => onItemTap(0),
            activeIconPath: 'assets/bottom_bar/active_home.svg',
            inactiveIconPath: 'assets/bottom_bar/inactive_home.svg',
            active: currentIndex == 0,
            title: 'ГЛАВНАЯ',
          ),
          BottomBarItem(
            onTap: () => onItemTap(1),
            activeIconPath: 'assets/bottom_bar/active_wallet.svg',
            inactiveIconPath: 'assets/bottom_bar/inactive_wallet.svg',
            active: currentIndex == 1,
            title: 'ДОХОДЫ',
          ),
          BottomBarItem(
            onTap: () => onItemTap(2),
            activeIconPath: 'assets/bottom_bar/active_news.svg',
            inactiveIconPath: 'assets/bottom_bar/inactive_news.svg',
            active: currentIndex == 2,
            title: 'НОВОСТИ',
          ),
          BottomBarItem(
            onTap: () => onItemTap(3),
            activeIconPath: 'assets/bottom_bar/active_settings.svg',
            inactiveIconPath: 'assets/bottom_bar/inactive_settings.svg',
            active: currentIndex == 3,
            title: 'НАСТРОЙКИ',
          ),
        ],
      ),
    );
  }
}
