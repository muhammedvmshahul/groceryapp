import 'package:flutter/material.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';

import 'notification_widget.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool value1 = true;
  bool value2 = false;
  bool value3 = false;
  bool value4 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: const Text('Notifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 36,bottom: 36),
        child: Column(
          children: [
            NotificationWidget(text1: 'Allow Notifications',
              text2: 'Lorem ipsum dolor sit amet, consetetur sadi\npscing elitr, sed diam nonumym',
              value: value1,
            ),
            const SizedBox(height: 12,),
            NotificationWidget(text1: 'Email Notifications',
              text2: 'Lorem ipsum dolor sit amet, consetetur sadi\npscing elitr, sed diam nonumym',
              value: value2,
            ),
            const SizedBox(height: 12,),
            NotificationWidget(text1: 'Order Notifications',
              text2: 'Lorem ipsum dolor sit amet, consetetur sadi\npscing elitr, sed diam nonumym',
              value: value3,
            ),
            const SizedBox(height: 12,),
            NotificationWidget(text1: 'General Notifications',
              text2: 'Lorem ipsum dolor sit amet, consetetur sadi\npscing elitr, sed diam nonumym',
              value: value4,
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(

                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColor.primaryDark,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Center(
                  child: Text('Save settings',style: TextStyle(color: AppColor.background1,fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
