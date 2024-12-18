import 'package:flutter/material.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';

import '../../../../../core/mediaQuery/mediaQuery.dart';
import '../../../products_list/products_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int cartItemCount = products.where((product) => product['qty'] > 0).length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = products;
    double totalPrice = 0;
    double total = 0;
    double totalAmount = 0;
    for (var fruit in items) {
      totalPrice += fruit['price'] * fruit['qty'];
      total += fruit['qty'] * 1.5;
      totalAmount += total + totalPrice;
    }
    setState(() {
      totalPrice;
      total;
      totalAmount;
    });
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.background1,
        title: const Text('Shopping Cart',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        // padding: const EdgeInsets.only(left:12,right: 12,top: 36,bottom: 36),
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 0, bottom: 1),
                child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: cartItemCount,
                    itemBuilder: (context, index) {
                      final items = products[index];
                      return SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/productPage',
                                    arguments: items);
                              },
                              child: Dismissible(
                                  key: Key(products.toString()),
                                  onDismissed: (direction) {
                                    setState(() {
                                      items['favorite'] = !items['favorite'];
                                    });
                                  },
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 20),
                                    // Background color when swiping
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                  child: Container(
                                    height: height * 0.12,
                                    width: width * 1,
                                    decoration: BoxDecoration(
                                        color: AppColor.background1,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width * 0.22,
                                            height: height * 0.1,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        items['background'])),
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                              items['product_image'],
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.09,
                                          ),
                                          // items name and price
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '\$ ${items['price']}',
                                                style: const TextStyle(
                                                    color: AppColor.primaryDark,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Text(items['name'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15)),
                                              Text(items['product_type'],
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12))
                                            ],
                                          ),
                                          const Spacer(),
                                          // adding and --
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    items['qty']++;
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: AppColor.primaryDark,
                                                ),
                                              ),
                                              Text(
                                                items['qty'].toString(),
                                                style: const TextStyle(
                                                    color: AppColor.text1,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (items['qty'] > 0) {
                                                      items['qty']--;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: AppColor.primaryDark,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            )),
                      );
                    }),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColor.background1,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                ),

                // width: ScreenSize.width * 1,
                // height: ScreenSize.height * 0.25,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 12, right: 12, bottom: 15),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(
                              color: AppColor.text1,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          totalPrice.toString(),
                          style: const TextStyle(
                              color: AppColor.text1,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Shipping charges',
                          style: TextStyle(
                              color: AppColor.text1,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          total.toString(),
                          style: const TextStyle(
                              color: AppColor.text1,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Divider(
                      color: AppColor.text1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          totalAmount.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/shippingMethod');
                      },
                      child: Container(
                        width: width * 1,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                            color: AppColor.primaryDark,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
