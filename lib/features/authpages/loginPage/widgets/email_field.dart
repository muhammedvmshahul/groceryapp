import 'package:flutter/material.dart';

import '../../../../core/textFields/myTextField.dart';


class EmailTextField extends StatefulWidget {
  final TextEditingController controller;
  const EmailTextField({super.key, required this.controller});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      controller: widget.controller,
      hintText: 'Email',
      prefixIcon: 'assets/icons/Group (2).svg',
      fieldHeight: 50,

      onChanged: (String value) {},
      validator: (value)
      {
        if (value == null || value.isEmpty) {
          return 'Email cannot be empty';
        }
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
        if (!emailRegex.hasMatch(value)) {
          return 'Enter a valid email address';
        }
        return null;
      },

    );
  }
}
