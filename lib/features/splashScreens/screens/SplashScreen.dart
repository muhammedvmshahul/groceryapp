import 'package:flutter/material.dart';
import 'package:groceryapp/features/authpages/authWelcome/pages/authWelcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/buttons/myBottun.dart';
import '../../../core/mediaQuery/mediaQuery.dart';
import 'imagesUrls.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> _saveButtonState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('saveValue', value);
  }
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> images = imagesMap;
    PageController _controller = PageController();
    return Scaffold(
      body: Stack(
        children: [
          // background image and content
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            itemBuilder: (context, index) {
              final items = images[index];
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(items['imageUrl']),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 59,
                    ),
                    Text(
                      items['name'],
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                  ],
                ),
              );
            },
          ),
          // smooth page indicator
          Container(
            alignment: const Alignment(0, 0.6),
            child: SmoothPageIndicator(
              controller: _controller,
              // The controller here tracks the current page
              count: images.length,
              // Set the count to the length of the list
              effect: const WormEffect(
                dotWidth: 8.0,
                dotHeight: 8.0,
                spacing: 6.0,
                activeDotColor: Colors.green,
                dotColor: Colors.grey,
              ),
            ),
          ),
          //  start button bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
                child: MyButton(
                  height: height * 0.07,
                    width: width * 0.9,
                    decoration:  BoxDecoration(
                        color: Colors.green,
                      borderRadius: BorderRadius.circular(5)

                    ),
                  onTap: ()async{
                    await _saveButtonState(true);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const AuthWelcome()));

                  },
                  child:  const Center(
                          child: Text(
                        'Get Start',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                ),
            ),
          )
        ],
      ),
    );
  }
}
