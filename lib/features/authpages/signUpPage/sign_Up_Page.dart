import 'package:flutter/material.dart';
import 'package:groceryapp/features/authpages/signUpPage/widget/email_Widget.dart';
import 'package:groceryapp/features/authpages/signUpPage/widget/password_widget.dart';
import 'package:groceryapp/features/authpages/signUpPage/widget/phone_number_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/buttons/myBottun.dart';
import '../../../core/mediaQuery/mediaQuery.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final String urlImage =
      'https://images.unsplash.com/photo-1519987684948-d25dbcf146db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTYwfHxncm9jZXJ5fGVufDB8fDB8fHww';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _validateForm() {

    if (_formKey.currentState!.validate()) {
      _saveButtonState(true);
      Navigator.pushNamed(context, '/MyHomeScreen');
    }

  }

  Future<void> _saveButtonState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loginValue', value);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(urlImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF4F5F9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                height: height * 0.60,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Sign in to your account',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 26),
                          EmailTextField(
                              controller: _emailController
                          ),
                          SizedBox(height: height * 0.009),
                                
                          PhoneNumberField(
                              controller: _phoneController
                          ),
                          SizedBox(height: height * 0.009),
                          PasswordField(
                              controller: _passwordController,
                            onChanged: (value) {
                                
                            },
                          ),
                             // button gap
                          SizedBox(height: height * 0.05),
                          MyButton(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onTap: _validateForm,
                            width: width,
                            height: height * 0.064,
                            child: const Center(
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account ? ',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to Login Page
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
