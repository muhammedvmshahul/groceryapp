import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';

import '../../../core/constants/imageContstants.dart';
import 'list_of_filter/search_history.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Dummy search history data
  // final List<String> history = ['Milk', 'Eggs', 'Bread', 'Fruits', 'Vegetables'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 249),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        // Menu action here
                      },
                      child: SvgPicture.asset(
                        'assets/icons/menu_icon.svg', // Ensure the path is correct
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Search History',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        history.clear();
                      });
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ChipList(
              listOfChipNames: history,
              activeBgColorList: [Theme.of(context).primaryColor],
              inactiveBgColorList: const [Colors.white],
              activeTextColorList: const [Colors.white],
              inactiveTextColorList: const [Colors.grey],
              listOfChipIndicesCurrentlySelected: const [],
              activeBorderColorList: [Theme.of(context).primaryColor],
              inactiveBorderColorList: const [Colors.transparent],
              style: const TextStyle(
                fontSize: 10,
              ),
              // extraOnChipPressed: (index) {
              //   // Handle chip press if needed
              // },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discover more',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        history.clear();
                      });
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ChipList(
              listOfChipNames: history,
              activeBgColorList: [Theme.of(context).primaryColor],
              inactiveBgColorList: const [Colors.white],
              activeTextColorList: const [Colors.white],
              inactiveTextColorList: const [Colors.grey],
              listOfChipIndicesCurrentlySelected: const [],
              activeBorderColorList: [Theme.of(context).primaryColor],
              inactiveBorderColorList: const [Colors.transparent],
              style: const TextStyle(
                fontSize: 10,
              ),
              // extraOnChipPressed: (index) {
              //   // Handle chip press if needed
              // },
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: ScreenSize.height*0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(IconConstants.cameraIcon),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('Image Search',style: TextStyle(fontSize: 12,color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: Container(
                    height: ScreenSize.height*0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mic,color: Colors.grey,size: 20,),
                        SizedBox(width: 5,),
                        Text('Voice search',style: TextStyle(fontSize: 12,color: Colors.grey),)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
