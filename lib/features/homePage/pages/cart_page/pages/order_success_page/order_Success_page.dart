import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/imageContstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/widgets/button_widget.dart';

import '../../../../../../core/constants/colorConstants.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: const Text(
          'Order Success',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: SizedBox(
                  height: ScreenSize.height*0.37,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        IconConstants.cartIcon,
                        width: ScreenSize.width * 0.4,
                      ),
                      SizedBox(
                        width: ScreenSize.width*0.5,
                        child: const Text(
                          'Your order was succesfull !',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: ScreenSize.width*0.68,
                        child: const Text(
                          'You will get a response within a few minutes.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColor.text1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize.height*0.2,
              ),
              ButtonWidget(onTap: (){
                Navigator.pushNamed(context, '/trackOrderPage');
              }, text: 'Track order')
            ],
          )),
    );
  }
}
