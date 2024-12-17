import 'package:flutter/material.dart';

import '../../../../../../core/constants/colorConstants.dart';



class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key, required this.value, required this.onChanged ,required this.text});
  final bool value;
  final Function(bool)? onChanged;
  final String text;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Row(
        children: [
          Transform.scale(
            scale: 0.7, // Resize the switch
            child: Switch(
              value: widget.value,
              onChanged: widget.onChanged,
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: AppColor.background3,
            ),
          ),

          Text(widget.text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
