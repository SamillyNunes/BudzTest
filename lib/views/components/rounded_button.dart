import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundedButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.blueLight,
        ),
        child: Icon(
          icon,
          color: AppColors.blue,
          size: 25,
        ),
      ),
    );
  }
}
