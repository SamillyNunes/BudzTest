import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class IndexIndicator extends StatelessWidget {
  final bool isCurrent;
  final bool isLast;

  const IndexIndicator({
    super.key,
    required this.isCurrent,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      height: 7,
      width: isCurrent ? 21 : 7,
      margin: isLast ? null : const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isCurrent ? AppColors.blueMedium : AppColors.greyLight,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
