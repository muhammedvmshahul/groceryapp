import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/myorder/list_of_orders.dart';

import '../../../../../../core/constants/imageContstants.dart';

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
        backgroundColor: AppColor.background1,
        title: const Text('My Order', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SvgPicture.asset(IconConstants.menuIcon),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
        child: ListView.builder(
          itemCount: listOfOrders.length,
          itemBuilder: (context, index) {
            final order = listOfOrders[index];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 9),
                child: ExpansionTileCard(
                  elevation: 0, // Optional: Add some elevation
                  baseColor: AppColor.background1, // Customize card color when collapsed
                  // expandedColor: AppColor.background1, // Customize card color when expanded
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ${order['orderNumber']}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Placed on ${order['orderPlaced']}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Text(
                            'items: ${order['items']}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'price: \$${order['price']}',
                            style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: Transform.translate(
                    offset: const Offset(-12, 0), // Shift the leading widget further left
                    child: CircleAvatar(
                      backgroundColor: AppColor.primaryLight,
                      radius: 20, // Adjust size as needed
                      child: SvgPicture.asset(
                        IconConstants.openBoxIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  // trailing: SvgPicture.asset(IconConstants.bottomArrow),
                  children: [
                    Container(
                      color: AppColor.background1, // Background color of expanded part
                      child: Stepper(
                        currentStep: List<Map<String, String>>.from(order['statuses'])
                            .indexWhere((step) => step['status'] == 'pending'),
                        steps: List<Map<String, String>>.from(order['statuses'])
                            .map((step) {
                          final isCompleted = step['status'] == 'completed'; // Check if the status is completed
                          return Step(
                            title: Text(
                              step['title']!,
                              style: TextStyle(
                                fontSize: 12,
                                color: isCompleted ? Colors.black : Colors.grey, // Completed steps are black, others are grey
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              step['date']!,
                              style: TextStyle(
                                fontSize: 12,
                                color: isCompleted ? Colors.black : Colors.grey, // Completed steps are black, others are grey
                              ),
                            ),
                            content: const SizedBox(), // No extra content for each step
                            state: isCompleted ? StepState.complete : StepState.indexed, // If completed, mark as complete
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
