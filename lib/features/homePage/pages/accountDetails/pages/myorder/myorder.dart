import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/myorder/list_of_orders.dart';
import '../../../../../../core/constants/imageContstants.dart';
import '../../../../../../core/mediaQuery/mediaQuery.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.background1,
        title: const Text('My Order',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SvgPicture.asset(IconConstants.menuIcon),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 10),
        child: SingleChildScrollView(
          child: SizedBox(
            height:height*1, // Constrain the height
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              // Disable scrolling for ListView
              itemCount: listOfOrders.length,
              itemBuilder: (context, index) {
                final order = listOfOrders[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: ExpansionTileCard(
                    elevation: 0,
                    baseColor: AppColor.background1,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order ${order['orderNumber']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'Placed on ${order['orderPlaced']}',
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Text(
                              'items: ${order['items']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'price: \$${order['price']}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    leading: Transform.translate(
                      offset: const Offset(-12, 0),
                      child: CircleAvatar(
                        backgroundColor: AppColor.primaryLight,
                        radius: 20,
                        child: SvgPicture.asset(
                          IconConstants.openBoxIcon,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    children: [
                      Container(
                        color: AppColor.background1,
                        child: Stepper(
                          currentStep:
                              List<Map<String, String>>.from(order['statuses'])
                                  .indexWhere(
                                      (step) => step['status'] == 'pending'),
                          steps:
                              List<Map<String, String>>.from(order['statuses'])
                                  .map((step) {
                            final isCompleted = step['status'] == 'completed';
                            return Step(
                              title: Text(
                                step['title']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      isCompleted ? Colors.black : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                step['date']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      isCompleted ? Colors.black : Colors.grey,
                                ),
                              ),
                              content: const SizedBox(),
                              state: isCompleted
                                  ? StepState.complete
                                  : StepState.indexed,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
