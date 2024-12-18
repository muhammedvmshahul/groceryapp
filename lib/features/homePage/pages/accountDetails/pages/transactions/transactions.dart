import 'package:flutter/material.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/transactions/transactions_list.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: Text('Transactions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, top: 25),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 22, top: 0, bottom: 0),
                width: width * 1,
                height: height * 0.11,
                decoration: BoxDecoration(color: AppColor.background1),
                child: Row(
                  children: [
                    // Circular Image
                    Container(
                      width: 52,
                      height: 52, // Ensure the height matches the width
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.background2,
                        image: DecorationImage(
                          image: AssetImage('assets/images/Group 142.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Add spacing between the image and text
                    // Centered Column for Text
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Center vertically
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Align text to the left
                        children: [
                          Text(
                            transaction['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Row(
                            children: [
                              Text(
                                transaction['date'],
                                style: TextStyle(fontSize: 10),
                              ),
                              Text(
                                ' at ${transaction['time']}',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$${transaction['amount']}',
                      style: TextStyle(
                          color: AppColor.primaryDark,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )
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
