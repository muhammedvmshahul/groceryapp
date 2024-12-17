import 'package:flutter/material.dart';

import '../../../../core/textFields/myTextField.dart';




class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const PasswordField({super.key, required this.onChanged,required this.controller,});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
        controller: controller,
        hintText: 'Password',
        prefixIcon: 'assets/icons/Group 5.svg',
        fieldHeight: 50,
        onChanged: onChanged,
        validator: (value) {

          if (value == null || value.isEmpty) {
            return 'Password cannot be empty';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        }

    );
  }
}
