import 'package:flutter/material.dart';

import '../../../../../../core/constants/colorConstants.dart';
import '../../../../../../core/mediaQuery/mediaQuery.dart';

class AddAddressScreen extends StatefulWidget {

  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.background1,
        centerTitle: true,
        title: const Text('Add Address',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name field
              _buildTextFormField(
                label: 'Name',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              // email address field
              _buildTextFormField(
                label: 'Email address',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              // phone number field
              _buildTextFormField(
                label: 'Phone number',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              // address field
              _buildTextFormField(
                label: 'Address',
                icon: Icons.location_on,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              // zip code field
              _buildTextFormField(
                label: 'Zip code',
                icon: Icons.map,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the zip code';
                  }
                  if (!RegExp(r'^\d{5,6}$').hasMatch(value)) {
                    return 'Please enter a valid zip code';
                  }
                  return null;
                },
              ),
              // city field
              _buildTextFormField(
                label: 'City',
                icon: Icons.location_city,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the city';
                  }
                  return null;
                },
              ),
              // country field
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: AppColor.primaryDark),
                  ),
                  prefixIcon:  Icon(Icons.public,color:AppColor.text1,),
                  labelText: 'Country',
                  labelStyle: TextStyle(color: AppColor.text1),
                  border: OutlineInputBorder(),
                ),
                items: ['India', 'USA', 'UK', 'Canada']
                    .map((country) => DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                ))
                    .toList(),
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.7, // Resize the switch
                    child: Switch(
                      value: true,
                      onChanged: (value) {
                        setState(() {
                          value==!value;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: AppColor.background3,
                    ),
                  ),

                  const Text('Save this address',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)
                ],
              ),
               SizedBox(height: height*0.1),
             //
              GestureDetector(
                onTap: (){
                  if (_formKey.currentState?.validate() == true){  // Handle form submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Address saved!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColor.primaryDark,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Center(
                    child: Text('Save settings',style: TextStyle(color: AppColor.background1,fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// textFormField widget
  Widget _buildTextFormField({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon,color: AppColor.text1,),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 15,color: AppColor.text1),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide:  BorderSide(color: AppColor.primaryDark),
          ),
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
