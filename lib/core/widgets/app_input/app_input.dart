import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final void Function(String)? onChanged;
  final String? errorMessage;

  const AppInput({
    super.key,
    this.controller,
    this.labelText,
    this.onChanged,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: labelText),
            onChanged: onChanged,
          ),
          if (errorMessage?.isNotEmpty ?? false)
            Text(
              errorMessage!,
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
        ],
      ),
    );
  }
}
