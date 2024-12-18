import 'package:flutter/material.dart';

import '../../../../../../core/constants/colorConstants.dart';
import '../../../../../../core/mediaQuery/mediaQuery.dart';



class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key, required this.text1,required this.text2, required this.value});
    final String text1;
    final String text2;
    final bool value;
  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late bool _currentValue;
  @override
  void initState() {
    // TODO: implement initState
    _currentValue = widget.value;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 17,right:0,top: 17,bottom: 17),
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
              Text(widget.text1,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              // SizedBox(height: 16,),
              Text(widget.text2,style: TextStyle(color: AppColor.text1,fontSize: 10,),textAlign: TextAlign.left,)
            ],
          ),
          Transform.scale(
            scale: 0.7,
            child: Switch(value: _currentValue,
              onChanged:(newValue){
                setState(() {
                  _currentValue =newValue;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: AppColor.background3,
            ),
          )
        ],
      ),
    );
  }
}
