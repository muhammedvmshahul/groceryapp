import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../categorie_list/categories_icons_list.dart';

class CategoriesGridCard extends StatelessWidget {
  const CategoriesGridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length, // Total number of items
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 120,
        crossAxisCount: 3,
        // Number of items per row
        crossAxisSpacing: 8,
        // Space between items horizontally
        mainAxisSpacing: 8,
        // Space between items vertically
        childAspectRatio: 1, // Width-to-height ratio of each item
      ),
      itemBuilder: (context, index) {
        final items = categories[index];
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/categoriesGridDetails',arguments: items);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white), // Background color of the container
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center items in the column
              children: [
                // Circle with background image and icon
                Container(
                  width: 66,
                  height: 66,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(items['background']), // Correct usage
                      fit: BoxFit.cover, // Ensures the image fills the circle
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      items['icon'],
                      height: 20, // Icon size
                    ),
                  ),
                ),
                // Text below the image
                const SizedBox(
                  height: 9,
                ),
                Center(
                  child: Text(
                    items['text'], // Replace with your category data
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
