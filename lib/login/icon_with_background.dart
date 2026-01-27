import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';

class IconWithBackground extends StatelessWidget {
  final String icon;
  final Color color;
  const IconWithBackground({super.key, required this.icon, this.color = AppColors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: color,
      ),
      child: Image.asset(icon, width: 24, height: 24),
    );
  }
}

