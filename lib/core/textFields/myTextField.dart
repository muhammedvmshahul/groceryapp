import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';


class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorFlag;
  final String prefixIcon;
  final String? suffixIcon;
  final ValueChanged<String> onChanged;
  final double fieldHeight;
  final double iconSize;
  final EdgeInsets fieldPadding;
final String? Function(String?)? validator;
  const CustomInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorFlag,
    required this.prefixIcon,
    this.suffixIcon,
    required this.onChanged,
    this.fieldHeight = 60.0,
    this.iconSize = 16.0,
    this.fieldPadding = const EdgeInsets.all(0), required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // double  width = MediaQuery.of(context).size.width;
    return Padding(
      padding: fieldPadding,
      child: TextFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          fillColor: AppColor.background1,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
          ),
          border: OutlineInputBorder(),
          hintText: hintText,
          hintStyle: TextStyle(
            color:Colors.grey,
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              prefixIcon,
              width: iconSize,
              height: iconSize,
            ),
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
            padding: const EdgeInsets.all(7),
            child: SvgPicture.asset(
              suffixIcon!,
              width: iconSize,
              height: iconSize,
            ),
          )
              : null,
        ),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
