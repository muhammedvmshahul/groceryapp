import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
 final void Function()? onTap;
 final double? width;
 final double? height;
 final Widget? child;
 final Decoration? decoration;
  const MyButton({super.key, required this.onTap, required this.width, required this.height, required this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: width,
        height: height,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
