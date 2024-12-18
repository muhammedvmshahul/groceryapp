import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/credit_card_page/card_list.dart';

import '../../../../../../core/constants/imageContstants.dart';
import '../../../../../../core/mediaQuery/mediaQuery.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColor.background2,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.background1,
        centerTitle: true,
        title: const Text('My Cards',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/addCreditCard');
            },
            child: Container(
              margin: const EdgeInsets.all(12),
              height: 23,
              width: 23,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: const Center( // Add Center widget here
                child: Icon(
                  Icons.add,
                  size: 16, // Adjust size to fit within the circle
                  weight: 800,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 25,bottom: 36),
        child: Column(
          children: [
            Expanded(
              flex: 30,
              child: ListView.builder(
                  itemCount: cardList.length,
                  itemBuilder: (context,index){
                    final card = cardList[index];
                    var cardNumber = card['cardNumber'];
                    int lastFourNumber = cardNumber%10000;
                    var year = card['expDate']['year'];
                    int lastTwo = year%100;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 19),
                      child: ExpansionTileCard(
                        leading: Transform.translate(
                          offset: const Offset(-12, 0), // Shift the leading widget further left
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: card['default']? Container(
                                  height: 14,
                                  width: 50,
                                  color: AppColor.primaryLight,
                                  child: const Center(child: Text('DEFAULT',style: TextStyle(fontSize: 8,color: AppColor.primaryDark),)),
                                ):const SizedBox()
                              ),

                              CircleAvatar(
                                backgroundColor: AppColor.background3,
                                radius: 20, // Adjust size as needed
                                child: SvgPicture.asset(
                                  IconConstants.cardColor,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(card['name'],
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('XXXX XXXX XXXX $lastFourNumber',
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                const Text('Expiry:',
                                  style: TextStyle(fontSize: 10, color: AppColor.text1, fontWeight: FontWeight.bold),
                                ),
                                Text(' ${card['expDate']['month']}/$lastTwo',style:  const TextStyle(fontSize: 10, color: AppColor.text1, fontWeight: FontWeight.bold)),
                                const Spacer(),
                                const Text('CVV:',style: TextStyle(fontSize: 10, color:AppColor.text1, fontWeight: FontWeight.bold),),
                                Text(card['cvv'].toString(),style:  const TextStyle(fontSize: 10, color: AppColor.text1, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ],
                        ),
                        children: [
                          Column(
                            children: [
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              //name
                              Padding(
                                padding: const EdgeInsets.only(left:25,right: 25),
                                child: Container(
                                  width: width*1,
                                  height: height*0.06,
                                  color: AppColor.background3,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20,),
                                      SvgPicture.asset(IconConstants.personIcon,color: Colors.grey,width: 18,height: 18,),
                                      const SizedBox(width: 20,),
                                      Text(card['name'],style: const TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              // address
                              Padding(
                                padding: const EdgeInsets.only(left:25,right: 25),
                                child: Container(
                                  width: width*1,
                                  height: height*0.06,
                                  color: AppColor.background3,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20,),
                                      SvgPicture.asset(IconConstants.cardIcon,color: Colors.grey,height: 16,width: 16,),
                                      const SizedBox(width: 20,),
                                      Text(card['cardNumber'].toString(),style: const TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left:25,right: 25),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // width: ScreenSize.width*0.5,
                                        height: height*0.06,
                                        color: AppColor.background2,
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 20,),
                                            SvgPicture.asset(IconConstants.calendarIcon,color: Colors.grey,height: 17,width: 17,),
                                            const SizedBox(width: 20,),
                                            Text('${card['expDate']['month']}/$lastTwo',style: const TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Container(
                                        // width: ScreenSize.width*0.5,
                                        height: height*0.06,
                                        color: AppColor.background2,
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 20,),
                                            SvgPicture.asset(IconConstants.lockIcon,color: Colors.grey,height: 12,width: 18,),
                                            const SizedBox(width: 20,),
                                            Text(card['cvv'].toString(),style: const TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                                          ],
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left:25,right: 25),
                                child: Container(
                                  width: width*1,
                                  height: height*0.06,
                                  color: AppColor.background3,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20,),
                                      SvgPicture.asset(IconConstants.earthIcon,color: Colors.grey,width: 18,height: 18,),
                                      const SizedBox(width: 20,),
                                      const Text('Country',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                                      const Spacer(),
                                      const Icon(Icons.arrow_drop_down,color: Colors.grey,),
                                      const SizedBox(width: 20,),
                                    ],

                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left:25,right: 25),
                                child: Container(
                                  width: width*1,
                                  height: height*0.06,
                                  color: AppColor.background3,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20,),
                                      SvgPicture.asset(IconConstants.earthIcon,color: Colors.grey,width: 18,height: 18,),
                                      const SizedBox(width: 20,),
                                      const Text('+91 123467890',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                                      const SizedBox(height: 23,),
                                    ],

                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:25,right: 25),
                                child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: 0.7, // Resize the switch
                                      child: Switch(
                                        value: card['default'],
                                        onChanged: (value) {
                                          setState(() {
                                            card['default'] = value;
                                          });
                                        },
                                        activeColor: Colors.white,
                                        activeTrackColor: Colors.green,
                                        inactiveThumbColor: Colors.grey,
                                        inactiveTrackColor: AppColor.background3,
                                      ),
                                    ),

                                    const Text('Make default',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
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
