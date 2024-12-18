import 'package:flutter/material.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';
import 'package:groceryapp/features/homePage/filterPage/filterPage.dart';
import 'package:groceryapp/features/homePage/MyHomeScreen.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/aboutMePage.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/address_page/my_address.dart';
import 'package:groceryapp/features/homePage/pages/cart_page/pages/order_success_page/order_Success_page.dart';
import 'package:groceryapp/features/homePage/pages/favorite_page/my_favorite.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/myorder/myorder.dart';
import 'package:groceryapp/features/homePage/pages/accountDetails/pages/transactions/transactions.dart';
import 'features/authpages/authWelcome/pages/authWelcome.dart';
import 'features/authpages/loginPage/login_page.dart';
import 'features/authpages/signUpPage/sign_Up_Page.dart';
import 'features/homePage/pages/accountDetails/accountScreen.dart';
import 'features/homePage/pages/accountDetails/pages/address_page/add_address_page.dart';
import 'features/homePage/pages/accountDetails/pages/credit_card_page/credit_card_page.dart';
import 'features/homePage/pages/accountDetails/pages/notification/notification_page.dart';
import 'features/homePage/pages/cart_page/pages/payment_method/payment_method.dart';
import 'features/homePage/pages/cart_page/pages/shipping_method/shipping_method.dart';
import 'features/homePage/pages/cart_page/pages/shippping_address/shipping_address.dart';
import 'features/homePage/pages/cart_page/pages/track_order/track_order_page.dart';
import 'features/homePage/pages/categories/categories.dart';
import 'features/homePage/pages/categories/categories_grid_details.dart';
import 'features/homePage/pages/homeScreen/search_filter.dart';
import 'features/homePage/pages/product_details/product_screen.dart';
import 'features/splashScreens/screens/SplashScreen.dart';
import 'features/splashScreens/screens/splash.dart';



void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const SignInPage(),
        '/authWelcome': (context) => const AuthWelcome(),
        '/splash': (context) => const SplashScreen(),
        '/MyHomeScreen':(context)=> const MyHomeScreen(),
        '/productPage':(context)=> const ProductScreen(),
        '/categoriesMore':(context)=> const CategoriesMore(),
        '/categoriesGridDetails':(context)=> const CategoriesGridDetails(),
        '/filterPage':(context)=> const FilterPage(),
        '/aboutMePage':(context)=> const AboutMePage(),
        '/myOrder':(context)=> const MyOrder(),
        '/accountScreen':(context)=> const AccountScreen(),
        '/myFavoritePage':(context)=> const MyFavoritePage(),
        '/myAddress':(context)=> const MyAddress(),
        '/creditCardPage':(context)=> const CreditCardPage(),
        '/addAccountPage':(context)=> const AddAddressScreen(),
        '/transactionsPage':(context)=> const TransactionsPage(),
        '/notificationPage':(context)=> const NotificationPage(),
        '/shippingMethod':(context)=> const ShippingMethod(),
        '/shippingAddress':(context)=> const ShippingAddress(),
        '/paymentMethod':(context)=> const PaymentMethod(),
        '/orderSuccessPage':(context)=> const OrderSuccessPage(),
        '/trackOrderPage':(context)=> const TrackOrderPage(),
        '/searchFilter':(context)=> const SearchFilter(),
        '/splashOut':(context)=> const Splash()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashOut',
    );
  }
}
