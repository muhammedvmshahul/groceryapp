import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/widgets/button_widget.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/widgets/switch_widget.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/widgets/textform_widget.dart';

import '../../../../../../core/constants/imageContstants.dart';


class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController zipcodeTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController countryTextController = TextEditingController();
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: const Text('Shipping Method',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12,right: 12,top: 22,bottom: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                // stepper
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
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryDark
                            ),
                            child: const Center(child: Text('1',style: TextStyle(color: Colors.white,fontSize: 15),)),
                          ),
                          // divider
                          const SizedBox(
                            width: 50,
                            height: 10,
                            child: Divider(
                              thickness: 2,
                              color: AppColor.primaryDark,
                            ),
                          ),
                          // address
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryDark,
                                // border:Border.all(color: Colors.grey)
                            ),
                            child: const Center(child: Text('2',style: TextStyle(color: AppColor.background1,fontSize: 15),)),
                          ),
                          // divider
                          Container(
                            width: 50,
                            height: 10,
                            child: const Divider(
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
                            child: const Center(child: Text('3',style: TextStyle(color: Colors.grey,fontSize: 15),)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const SizedBox(
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
        Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  // name field
                  Padding(
                    padding: const EdgeInsets.only(top:37),
                    child: TextFormWidget(
                        validator:(value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null; // Return null if validation passes
                        },
                      controller: nameTextController,
                      text: 'Name',
                      icon: IconConstants.personIcon,
                      ),
                  ),
                  // email field
                  TextFormWidget(
                    validator:(value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Email validation regex
                      final RegExp emailRegex =
                      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Valid email// Return null if validation passes
                    },
                    controller: emailTextController,
                    text: 'Email address',
                    icon: IconConstants.emailIcon,
                  ),
                  // phone number field
                  TextFormWidget(
                    validator:(value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // Phone number validation regex
                      final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
                      if (!phoneRegex.hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null; // Valid phone number
                    },
                    controller: phoneTextController,
                    text: 'Phone number',
                    icon: IconConstants.phoneIcon,
                  ),
                  // address field
                  TextFormWidget(
                    validator:(value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      final words = value.trim().split(RegExp(r'\s+')); // Split by spaces
                      if (words.length != 10) {
                        return 'Please enter exactly 10 words';
                      }
                      return null;  // Valid phone number
                    },
                    controller: addressTextController,
                    text: 'Address',
                    icon: IconConstants.homeLocation,
                  ),
                  // zipcode field
                  TextFormWidget(
                    validator:(value) {
                      return (value != null && RegExp(r'^\d{6}$').hasMatch(value))
                          ? null
                          : 'Please enter exactly 6 digits'; // Valid phone number
                    },
                    controller: zipcodeTextController,
                    text: 'Zipcode',
                    icon: IconConstants.keyBoardIcon,
                  ),
                  const SizedBox(height: 5,),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: AppColor.background1,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(color: AppColor.primaryDark),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent,), // Change this color
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent), // Change this color as well
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      prefixIcon:  Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(IconConstants.earthIcon,color: AppColor.text1),
                      ),
                      hintText: 'Country',
                      hintStyle: const TextStyle(color: AppColor.text1),
                      border: const OutlineInputBorder(),
                    ),
                    items: ['India', 'USA', 'UK', 'Canada']
                        .map((country) => DropdownMenuItem<String>(
                      value: country,
                      child: Text(country),
                    ))
                        .toList(),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a country';
                      }
                      return null;
                    },
                  ),
                 SwitchWidget(
                   text: 'Save this Address',
                     value: _value,
                     onChanged: (value) {
                       setState(() {
                         _value=!_value;
                       });
                     }

                 )
                ],
              ),
              SizedBox(height: height*0.10773480662,),
              ButtonWidget(onTap:  (){
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, proceed with saving settings
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is valid, proceeding with saving settings')),
                  );
                  Navigator.pushNamed(context, '/paymentMethod');
                } else {
                  // If form is invalid, show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is invalid, please check your inputs')),
                  );
                }

              }, text: 'next')

            ],
          ),
        ),
            ],
          ),
        ),
      ),
    );
  }
}
