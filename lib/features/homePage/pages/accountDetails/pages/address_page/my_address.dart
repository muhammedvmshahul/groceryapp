import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/address_page/list_of_address.dart';

import '../../../../../../core/constants/imageContstants.dart';



class MyAddress extends StatefulWidget {
  const MyAddress({super.key});

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        centerTitle: true,
        title: const Text('My Address',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        actions: [
          GestureDetector(
            onTap: (){
                  Navigator.pushNamed(context, '/addAccountPage');
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
                  itemCount: addressList.length,
                  itemBuilder: (context,index){
                    final address = addressList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 19),
                  child: ExpansionTileCard(
                    leading: Transform.translate(
                      offset: const Offset(-12, 0), // Shift the leading widget further left
                      child: CircleAvatar(
                        backgroundColor: AppColor.primaryLight,
                        radius: 20, // Adjust size as needed
                        child: SvgPicture.asset(
                          IconConstants.homeLocation,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(address['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(address['address'],
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        Text(address['phone'],
                          style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
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
                              width: ScreenSize.width*1,
                              height: ScreenSize.height*0.06,
                              color: AppColor.background3,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  SvgPicture.asset(IconConstants.personIcon,color: Colors.grey,width: 18,height: 18,),
                                  const SizedBox(width: 20,),
                                  const Text('Name',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          // address
                          Padding(
                            padding: const EdgeInsets.only(left:25,right: 25),
                            child: Container(
                              width: ScreenSize.width*1,
                              height: ScreenSize.height*0.06,
                              color: AppColor.background3,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  SvgPicture.asset(IconConstants.homeLocation,color: Colors.grey,height: 20,width: 16,),
                                  const SizedBox(width: 20,),
                                  const Text('Address',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
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
                                  height: ScreenSize.height*0.06,
                                  color: AppColor.background2,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20,),
                                      SvgPicture.asset(IconConstants.mapIcon,color: Colors.grey,height: 17,width: 17,),
                                      const SizedBox(width: 20,),
                                      const Text('City',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
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
                                    height: ScreenSize.height*0.06,
                                   color: AppColor.background2,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 20,),
                                        SvgPicture.asset(IconConstants.keyBoardIcon,color: Colors.grey,height: 12,width: 18,),
                                        const SizedBox(width: 20,),
                                        const Text('Zipcode',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
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
                              width: ScreenSize.width*1,
                              height: ScreenSize.height*0.06,
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
                              width: ScreenSize.width*1,
                              height: ScreenSize.height*0.06,
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
                                    value: address['default'],
                                    onChanged: (value) {
                                      setState(() {
                                        address['default'] = value;
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
            Container(

              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColor.primaryDark,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: const Center(
                child: Text('Save settings',style: TextStyle(color: AppColor.background1,fontWeight: FontWeight.bold,fontSize: 15),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
