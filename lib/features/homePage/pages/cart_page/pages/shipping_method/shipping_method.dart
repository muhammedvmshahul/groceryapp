import 'package:flutter/material.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/shipping_method/method_widget.dart';




class ShippingMethod extends StatefulWidget {
  const ShippingMethod({super.key});

  @override
  State<ShippingMethod> createState() => _ShippingMethodState();
}

class _ShippingMethodState extends State<ShippingMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: Text('Shopping Method',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 22,bottom: 22),
        child: Column(
              children: [
                // stepper
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // delivery
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryDark
                              ),
                              child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontSize: 15),)),
                            ),
                            // divider
                            SizedBox(
                              width: 50,
                              height: 10,
                              child: Divider(
                                thickness: 2,
                                color: AppColor.text1,
                              ),
                            ),
                            // address
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.background1,
                                  border:Border.all(color: Colors.grey)
                              ),
                              child: Center(child: Text('2',style: TextStyle(color: AppColor.text1,fontSize: 15),)),
                            ),
                            // divider
                            Container(
                              width: 50,
                              height: 10,
                              child: Divider(
                                thickness: 2,
                                color: Colors.grey,
                              ),
                            ),
                            // payment
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.background1,
                                  border:Border.all(color: Colors.grey)
                              ),
                              child: Center(child: Text('3',style: TextStyle(color: Colors.grey,fontSize: 15),)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        width: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery',style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),),
                            Text('Address',style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),),
                            Text('Payment',style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 52,),
                MethodWidget(
                    text1: 'Standard Delivery',
                    text2: 'Order will be delivered between 3 - 4 business\ndays straights to your doorstep.',
                    value: true,
                  text3: '\$3',
                ),
                MethodWidget(
                  text1: 'Next Day Delivery',
                  text2: 'Order will be delivered between 3 - 4 business\ndays straights to your doorstep.',
                  value: true,
                  text3: '\$5',
                ),
                MethodWidget(
                  text1: 'Nominated Delivery',
                  text2: 'Order will be delivered between 3 - 4 business\ndays straights to your doorstep.',
                  value: true,
                  text3: '\$3',
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                      Navigator.pushNamed(context, '/shippingAddress');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColor.primaryDark,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text('Next',style: TextStyle(color: AppColor.background1,fontWeight: FontWeight.bold,fontSize: 15),),
                    ),
                  ),
                )
              ],
        ),
      ),
    );
  }
}
