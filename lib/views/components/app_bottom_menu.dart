import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

const iconsPngPath = 'assets/icons/png';

class AppBottomMenu extends StatelessWidget {
  const AppBottomMenu({
    super.key,
  });

  BottomNavigationBarItem _menuItem({
    required String iconPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
      ),
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.blueLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(
          iconPath,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.textSecondary,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: [
        _menuItem(iconPath: '$iconsPngPath/home.png', label: 'Início'),
        _menuItem(iconPath: '$iconsPngPath/grid_view.png', label: 'Jornadas'),
        _menuItem(iconPath: '$iconsPngPath/buddy.png', label: 'Buddy IA'),
        _menuItem(iconPath: '$iconsPngPath/person.png', label: 'Perfil'),
      ],
    );
  }
}
