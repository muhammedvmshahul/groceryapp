import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/colorConstants.dart';
import '../../../../../../core/constants/imageContstants.dart';



class TextFormWidget extends StatefulWidget {
  const TextFormWidget({super.key,required this.validator,required this.controller, required this.text, required this.icon});
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? text;
  final String? icon;
  @override

  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent,), // Change this color
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent), // Change this color as well
            ),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)
            ),
            isDense: true,
            fillColor: AppColor.background1,
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(widget.icon.toString(),color: AppColor.text1),
            ),
            hintText: widget.text,
            hintStyle: TextStyle(color: AppColor.text1,fontSize: 15,fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryDark)
            )
        ),
        validator: widget.validator,
      ),
    );
  }
}
