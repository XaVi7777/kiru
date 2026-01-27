import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiru/app_colors.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final double width;
  final double height;
  final Color color;

  const SvgIcon({
    super.key,

    required this.icon,
    this.color = AppColors.black,
    this.width = 24,
    this.height = 24,
  });

  const SvgIcon.logo({super.key, this.width = 68, this.height = 81})
    : icon = 'assets/images/logo.svg',
      color = AppColors.black;

  const SvgIcon.home({super.key, this.width = 24, this.height = 24})
    : icon = 'assets/icons/home.svg',
      color = AppColors.black;

  const SvgIcon.favorites({super.key, this.width = 24, this.height = 24})
    : icon = 'assets/icons/favorites.svg',
      color = AppColors.black;

  const SvgIcon.recommendations({super.key, this.width = 24, this.height = 24})
    : icon = 'assets/icons/recomendations.svg',
      color = AppColors.black;

  const SvgIcon.profile({super.key, this.width = 24, this.height = 24})
    : icon = 'assets/icons/profile.svg',
      color = AppColors.black;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon);
  }
}
