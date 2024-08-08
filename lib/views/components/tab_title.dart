import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class TabTitle extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const TabTitle(
      {super.key,
      required this.title,
      required this.description,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: size.width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Row(
            children: [
              Text(
                'Ver tudo',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.blue,
                size: 13,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
