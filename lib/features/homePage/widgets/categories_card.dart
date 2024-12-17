import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../categorie_list/categories_icons_list.dart';


class CategoriesCard extends StatefulWidget {
  const CategoriesCard({super.key});

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = categories;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/categoriesGridDetails',arguments: item);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          AssetImage(item['background']),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      item['icon'],
                    ),
                  ),
                ),
                Text(
                  item['text'],
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
