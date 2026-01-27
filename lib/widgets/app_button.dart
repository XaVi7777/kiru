import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final bool isLoading;
  final bool isDisabled;
  final String? text;

  const AppButton({
    super.key,
    required this.onTap,
    this.backgroundColor = AppColors.black,
    this.isLoading = false,
    this.isDisabled = false,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: Opacity(
        opacity: isDisabled ? .5 : 1,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onTap,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(backgroundColor),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          child: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading) CircularProgressIndicator(),
              Text(
                text ?? '',
                style: TextStyle(
                  color: AppColors.buttonPrimaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
