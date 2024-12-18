import 'package:flutter/material.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/core/constants/imageContstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/widgets/button_widget.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/widgets/switch_widget.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/widgets/textform_widget.dart';

import '../widgets/card_widget.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController monthYearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  bool _value = true;
   int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: const Text(
          'Payment Method',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 22, bottom: 22),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
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
                                color: AppColor.primaryDark),
                            child: const Center(
                                child: Text(
                              '1',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
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
                            child: const Center(
                                child: Text(
                              '2',
                              style: TextStyle(
                                  color: AppColor.background1, fontSize: 15),
                            )),
                          ),
                          // divider
                          Container(
                            width: 50,
                            height: 10,
                            child: const Divider(
                              thickness: 2,
                              color: AppColor.primaryDark,
                            ),
                          ),
                          // payment
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primaryDark,
                              // border:Border.all(color: Colors.grey)
                            ),
                            child: const Center(
                                child: Text(
                              '3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Address',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Payment',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CardWidget(
                      selectedIndex: selectedIndex,
                      index: 1,
                      icon: IconConstants.paypalIcon,
                      text: 'paypal',
                      onTap: () {
                        setState(() {
                          selectedIndex = 1; // Update the selected index when PayPal is tapped
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CardWidget(
                      selectedIndex: selectedIndex,
                      index: 2,
                      icon: IconConstants.cardIcon,
                      text: 'Credit card',
                      onTap: () {
                        setState(() {
                          selectedIndex = 2; // Update the selected index when Credit Card is tapped
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CardWidget(
                      selectedIndex: selectedIndex,
                      index: 3,
                      icon: IconConstants.appleIcon,
                      text: 'Applepay',
                      onTap: () {
                        setState(() {
                          selectedIndex = 3; // Update the selected index when ApplePay is tapped
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.006,
              ),
              Container(
                height: height*0.23, // Adjust height based on your design
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage(ImageConstants.cardImage), // Your card background image
                  ),
                ),
                child: const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Card Number (Last 4 digits)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '**** **** **** 8790', // Last 4 digits
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      // Spacer
                      Spacer(),
                      // Cardholder name and expiry date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Cardholder Name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CARD HOLDER',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'RUSSELL AUSTIN', // Replace with actual cardholder name
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          // Expiry Date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EXPIRES',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 0),
                              Text(
                                '01/22', // Replace with actual expiry date
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              ,
              SizedBox(
                child: Column(
                  children: [
                    // name on the card field
                    TextFormWidget(
                        validator: (value) {},
                        controller: cardNameController,
                        text: 'Name on the card',
                        icon: IconConstants.personIcon),
                    // card number field
                    TextFormWidget(
                        validator: (value) {},
                        controller: cardNumberController,
                        text: 'Card Number',
                        icon: IconConstants.cardIcon),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormWidget(
                                validator: (value) {},
                                controller: monthYearController,
                                text: 'Month/Year',
                                icon: IconConstants.calendarIcon)),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Expanded(
                            child: TextFormWidget(
                                validator: (value) {},
                                controller: cvvController,
                                text: 'CVV',
                                icon: IconConstants.lockIcon))
                      ],
                    ),
                    // card saving switch
                    SwitchWidget(
                      text: 'Save this card',
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = !_value;
                        });
                      },
                    ),
                    ButtonWidget(onTap: () {
                      Navigator.pushNamed(context, '/orderSuccessPage');
                    }, text: 'Next')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
