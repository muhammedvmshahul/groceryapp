import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/imageContstants.dart';
import '../../widgets/product_card.dart';

class CategoriesGridDetails extends StatelessWidget {
  const CategoriesGridDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset(IconConstants.menuIcon),
          )
        ],
        title: Text(
          data['text'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 245, 249),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 25,left: 12,right: 12),
          child: ProductCard(),
        ),
      ),
    );
  }
}
