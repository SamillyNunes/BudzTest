import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_images.dart';

class AppBottomMenu extends StatefulWidget {
  const AppBottomMenu({
    super.key,
  });

  @override
  State<AppBottomMenu> createState() => _AppBottomMenuState();
}

class _AppBottomMenuState extends State<AppBottomMenu> {
  int currentIndex = 0;

  BottomNavigationBarItem _menuItem({
    required String iconPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        color: AppColors.textSecondary,
      ),
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.blueLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(
          iconPath,
          color: AppColors.blue,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.textSecondary,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: [
        _menuItem(iconPath: AppImages.homeIcon, label: 'Início'),
        _menuItem(iconPath: AppImages.gridViewIcon, label: 'Jornadas'),
        _menuItem(iconPath: AppImages.buddyIcon, label: 'Buddy IA'),
        _menuItem(iconPath: AppImages.personIcon, label: 'Perfil'),
      ],
    );
  }
}
