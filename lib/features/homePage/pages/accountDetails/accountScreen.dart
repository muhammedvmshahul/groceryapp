import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/imageContstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';
import 'package:groceryapp/features/homePage/pages/widgets/details_widget.dart';
import '../../../../core/constants/colorConstants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://media.gettyimages.com/id/1245965643/photo/cristiano-ronaldo-is-officially-unveiled-as-al-nassr-player.webp?s=2048x2048&w=gi&k=20&c=i6o-3uFga51UBIJfKdvp-LzhPI3FjY_uVg3Ec83TeUE=';

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: ScreenSize.width * 1,
            height: ScreenSize.height * 1,
            color: AppColor.background2,
          ),
          Container(
            width: ScreenSize.width * 1,
            height: ScreenSize.height * 0.2,
            color: AppColor.background1,
          ),
          // dp image circle
          Padding(
            padding: const EdgeInsets.only(top:80),
            child: Align(
              // alignment: Alignment(-0.01,0), // Adjusted alignment here
              child: Column(
                children: [
                  // image container
                  SizedBox(
                    width: 120, // Set width
                    height: 120, // Set height
                    child: Stack(
                      children: [
                        // Profile picture
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(imageUrl), // Replace with your image URL
                        ),
                        // Camera icon overlay
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              // Add your camera/gallery logic here
                            },
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.camera_alt,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // names and email
                 const  Text('Ronaldo',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                  const Text('UR.Ronaldo@gmail.com',style: TextStyle(fontSize: 12,color: AppColor.text1),)
                ],
              ),
            ),
          ),
         Padding(
            padding:  const EdgeInsets.only(top: 240),
            child: SizedBox(
              child: Column(
                children: [
                 GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, '/aboutMePage');
                     },
                     child: const DetailsWidget(icon:IconConstants.personIcon, text:'About me' )),
                  GestureDetector(
                      onTap: (){
                          Navigator.pushNamed(context, '/myOrder');
                      },
                      child: const DetailsWidget(icon: IconConstants.boxIcon, text: 'My Orders')),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/myFavoritePage');
                      },
                      child: const DetailsWidget(icon: IconConstants.favoriteIcon, text: 'My Favorite')),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/myAddress');
                      },
                      child: const DetailsWidget(icon: IconConstants.locationIcon, text: 'My Address')),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/creditCardPage');
                      },
                      child: const DetailsWidget(icon: IconConstants.cardIcon, text: 'Credit Cards')),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/transactionsPage');
                      },
                      child: const DetailsWidget(icon: IconConstants.dollarIcon, text: 'Transactions')),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/notificationPage');
                      },
                      child: const DetailsWidget(icon: IconConstants.notificationIcon, text:'Notification')),
                  Padding(
                    padding: const EdgeInsets.only(left: 12,top: 28),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width:20,
                              height: 20,
                              child: SvgPicture.asset(IconConstants.backButtonIcon,color: AppColor.primaryDark,)),
                          const SizedBox(width: 15,),
                          const Text('Sign out',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}