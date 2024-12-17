import 'package:flutter/material.dart';

import '../../../../../../core/constants/colorConstants.dart';




class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: AppColor.primaryDark,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(text,style: const TextStyle(color: AppColor.background1,fontWeight: FontWeight.bold,fontSize: 15),),
        ),
      ),
    );
  }
}
