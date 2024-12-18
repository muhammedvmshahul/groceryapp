
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/accountScreen.dart';
import 'package:groceryapp/features/homePage/pages/favorite_page/my_favorite.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/cartScreen.dart';
import 'package:groceryapp/features/homePage/pages/homeScreen/home_screen.dart';
import '../../core/constants/imageContstants.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  bool favorite = false;
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),      // Home Page
    const MyFavoritePage(), // Favorites Page
    const CartScreen(),   // Cart Page
    const AccountScreen(),   // Account Page
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: AppColor.background1,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 2) { // For Cart Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          } else {
            setState(() {
              selectedIndex = index; // Update index only for other pages
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                IconConstants.homeIcon,
                color: selectedIndex == 0 ? Colors.green : Colors.grey,
                width: 24,
                height: 24,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(IconConstants.favoriteIcon,
                  color: selectedIndex == 1 ? Colors.green : Colors.grey,
                  width: 24,
                  height: 24)),
          BottomNavigationBarItem(
              label: '',
              icon: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(IconConstants.cartIcon,
                    color: selectedIndex == 2 ? Colors.green : Colors.grey,
                    width: 24,
                    height: 24),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/accountDetails',
                      arguments: selectedIndex);
                },
                child: SvgPicture.asset(IconConstants.personIcon,
                    color: selectedIndex == 3 ? Colors.green : Colors.grey,
                    width: 24,
                    height: 24),
              )),
        ],
      ),
      body: _pages[selectedIndex]
    );
  }
}
