import 'package:flutter/material.dart';

import '../../../../core/textFields/myTextField.dart';



class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  const PhoneNumberField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      controller: controller,
      hintText: 'Phone number',
      prefixIcon: 'assets/icons/Group 8.svg',
      fieldHeight: 50,

      onChanged: (String value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number cannot be empty';
        }
        if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
          return 'Phone number must be 10 digits';
        }
        return null;
      }

    );
  }
}
