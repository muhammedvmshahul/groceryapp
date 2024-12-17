import 'package:flutter/material.dart';
import 'package:groceryapp/core/buttons/myBottun.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceryapp/features/authpages/signUpPage/sign_Up_Page.dart';

import '../../../../core/mediaQuery/mediaQuery.dart';
import '../../loginPage/login_page.dart';

class AuthWelcome extends StatelessWidget {
  const AuthWelcome({super.key});

  final String _backgroundImage =
      'https://images.pexels.com/photos/18640811/pexels-photo-18640811/free-photo-of-close-up-of-red-peppers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(_backgroundImage), fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFF4F5F9),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              height: ScreenSize.height * 0.44,
              width: ScreenSize.width * 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 36, right: 16, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Center(
                      // auth google button
                      child: MyButton(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          onTap: () {},
                          width: ScreenSize.width * 1,
                          height: ScreenSize.height * 0.064,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: ScreenSize.height * 0.03,
                                width: ScreenSize.width * 0.06,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/google.png'),
                                        fit: BoxFit.fill)),
                              ),
                              const Text(
                                'Continue with google',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: ScreenSize.width * 0.05,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      // account Create  button
                      child: MyButton(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));

                          },
                          width: ScreenSize.width * 1,
                          height: ScreenSize.height * 0.064,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Vector.svg',
                                width: ScreenSize.width * 0.06,
                                height: ScreenSize.height * 0.03,
                              ),
                            const  Text(
                                'Create an account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: ScreenSize.width * 0.05,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Login  Text button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ? ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/login');
                          },
                            child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
