import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/imageContstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';

import '../../../../core/buttons/myBottun.dart';
import '../../../../core/constants/colorConstants.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: const Text(
          'Apply Filter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child:
                GestureDetector(onTap: () {}, child: const Icon(Icons.rotate_left)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:  EdgeInsets.only(left: 16),
                      child: Text(
                        'Price tag',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: height * 0.05,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'min.',
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: AppColor.text1),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    filled: true,
                                    fillColor: AppColor.background3,
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'max.',
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: AppColor.text1),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    filled: true,
                                    fillColor: AppColor.background3,
                                    border: OutlineInputBorder()),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   const  Divider(
                      height: 20,
                      color: AppColor.background2,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Star rating',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 8.0, left: 8),
                            height: height * 0.06,
                            width: width * 1,
                            decoration: BoxDecoration(
                                color: AppColor.background3,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                const Spacer(),
                                const Text(
                                  '3 star',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColor.text1),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 20,
                      color: AppColor.background2,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Others',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconConstants.cardIcon,
                                width: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Discount',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.text1)),
                              const Spacer(),
                              GestureDetector(
                                child: SvgPicture.asset(
                                  IconConstants.checkedIcon,
                                  width: 16,
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.background2,
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconConstants.deliveryIcon,
                                width: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Free shipping',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.text1)),
                              const Spacer(),
                              GestureDetector(
                                child: SvgPicture.asset(
                                  IconConstants.checkedIcon,
                                  width: 16,
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.background2,
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconConstants.boxIcon,
                                width: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('same day delivery',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.text1)),
                              const Spacer(),
                              GestureDetector(
                                child: SvgPicture.asset(
                                  IconConstants.checkedIcon,
                                  width: 16,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height*0.21,
              ),
              MyButton(
                height: height * 0.07,
                width: width * 1,
                onTap: () {
                  Navigator.pop(context);
                },
                decoration: BoxDecoration(
                    color: AppColor.primaryDark,
                    borderRadius: BorderRadius.circular(5)),
                child:  const Center(
                  child: Text(
                    'Apply filter',
                    style: TextStyle(
                        color: AppColor.background1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
