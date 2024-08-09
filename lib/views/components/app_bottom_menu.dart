import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

const iconsPngPath = 'assets/icons/png';

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
