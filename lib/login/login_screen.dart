import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/login/buttons_panel.dart';
import 'package:kiru/widgets/svg_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(right: 40, left: 40),
        child: Column(
          children: [
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 13,
              children: [
                SvgIcon.logo(),
                Padding(
                  padding: const EdgeInsets.only(top: 29, bottom: 8),
                  child: Text(
                    'Kiru',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 57),
            ButtonsPanel(),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
