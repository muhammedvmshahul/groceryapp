import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
  });

  final String icon;
  final String text;
  final int index;
  final int selectedIndex;
  final Function()? onTap;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: height * 0.12,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.selectedIndex == widget.index ? AppColor.primaryDark : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 8),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.icon,
              height: 22,
              width: 30,
              color: widget.selectedIndex == widget.index ? AppColor.primaryDark : AppColor.text1,
            ),
            const SizedBox(height: 16),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: widget.selectedIndex == widget.index ? AppColor.primaryDark : AppColor.text1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
