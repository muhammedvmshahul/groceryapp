import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/imageContstants.dart';
import 'package:groceryapp/features/homePage/pages/categories/widgets/categories_card.dart';

class CategoriesMore extends StatelessWidget {
  const CategoriesMore({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 249),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset(IconConstants.menuIcon),
          )
        ],
        centerTitle: true,
        title: const Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: const Padding(
          padding:  EdgeInsets.only(left: 15, right: 15, top: 21),
          child: CategoriesGridCard(
          )),
    );
  }
}
