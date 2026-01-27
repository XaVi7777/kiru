import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiru/app_colors.dart';

class ButtonsPanel extends StatelessWidget {
  const ButtonsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 58,
          child: ElevatedButton(
                        onPressed: () {
              context.go('/register');
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.black),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            child: Text(
              'Регистрация',
              style: TextStyle(
                color: AppColors.buttonPrimaryText,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 58,
          child: TextButton(
            onPressed: () {
              context.go('/auth');
            },
            child: Text(
              'Войти',
              style: TextStyle(
                color: AppColors.buttonSecondaryText,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
