import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/core/constants/imageContstants.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: const Text("About me",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 12,bottom: 36),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 34,
                  ),
                  const Text('Personal Details',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  // name
                  const SizedBox(height: 13,),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                   
                    child: Row(
                      children: [
                        SizedBox(
                            height:20,
                            width: 20,
                            child: SvgPicture.asset(IconConstants.personIcon,color: AppColor.text1,)),
                        const SizedBox(width: 21,),
                        const Text('UR.Ronaldo',style: TextStyle(color: AppColor.text1,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  // email
                  const SizedBox(height: 5,),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    child: Row(
                      children: [
                        SizedBox(
                            height:20,
                            width: 20,
                            child: SvgPicture.asset(IconConstants.emailIcon,color: AppColor.text1,)),
                        const SizedBox(width: 21,),
                        const Text('UR.Ronaldo@cr7.com',style: TextStyle(color: AppColor.text1,fontWeight: FontWeight.w500),),


                      ],
                    ),
                  ),
                  // phone number
                  const SizedBox(height: 5,),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    child: Row(
                      children: [
                        SizedBox(
                            height:20,
                            width: 20,
                            child: SvgPicture.asset(IconConstants.phoneIcon,color: AppColor.text1,)),
                        const SizedBox(width: 21,), const SizedBox(height: 13,),
                        const Text('+918589040021',style: TextStyle(color: AppColor.text1,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                  // password section
                  const SizedBox(
                    height: 34,
                  ),
                  const Text('Change Password',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  // name
                  const SizedBox(height: 13,),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    child: Row(
                      children: [
                        SizedBox(
                            height:20,
                            width: 20,
                            child: SvgPicture.asset(IconConstants.lockIcon,color: AppColor.text1,)),
                        const SizedBox(width: 21,),
                        const Text('current password',style: TextStyle(color: AppColor.text1,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  // email
                  const SizedBox(height: 5,),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    child: Row(
                      children: [
                        SizedBox(
                            height:20,
                            width: 20,
                            child: SvgPicture.asset(IconConstants.lockIcon,color: AppColor.text1,)),
                        const SizedBox(width: 21,),
                        const Text('**************',style: TextStyle(color: AppColor.text1,fontWeight: FontWeight.w500),),


                      ],
                    ),
                  ),
                  // phone number
                  const SizedBox(height: 5,),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    child: Row(
                      children: [
                        SizedBox(
                            height:20,
                            width: 20,
                            child: SvgPicture.asset(IconConstants.lockIcon,color: AppColor.text1,)),
                        const SizedBox(width: 21,), const SizedBox(height: 13,),
                        const Text('Confirm password',style: TextStyle(color: AppColor.text1,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),

                  // save button
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
