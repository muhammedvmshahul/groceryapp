import 'package:flutter/material.dart';

import '../../../../../../core/constants/colorConstants.dart';
import '../../../../../../core/mediaQuery/mediaQuery.dart';




class MethodWidget extends StatefulWidget {
  const MethodWidget({super.key, required this.text1,required this.text2, required this.value, required this.text3});
  final String text1;
  final String text2;
  final bool value;
  final String text3;
  @override
  State<MethodWidget> createState() => _MethodWidgetState();
}

class _MethodWidgetState extends State<MethodWidget> {
  late bool _currentValue;
  @override
  void initState() {
    // TODO: implement initState
    _currentValue = widget.value;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Container(
        padding: const EdgeInsets.only(left: 17,right:17,top: 17,bottom: 17),
        color: AppColor.background1,
        height: height*0.127,
        width: width*1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.text1,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                // SizedBox(height: 16,),
                Text(widget.text2,style: const TextStyle(color: AppColor.text1,fontSize: 10,),textAlign: TextAlign.left,)
              ],
            ),
          Text(widget.text3,style: const TextStyle(color: AppColor.primaryDark,fontSize: 15,),)
          ],
        ),
      ),
    );
  }
}

