import 'package:flutter/material.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';

import '../../../../core/mediaQuery/mediaQuery.dart';
import '../../widgets/categories_card.dart';
import '../../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String offerImage =
        'https://img.freepik.com/free-vector/gradient-supermarket-webinar-template_23-2149361396.jpg?t=st=1732513615~exp=1732517215~hmac=ca11e66ebc708254389a05ef0830c57277e3913e1610fe2fa1cd449b7a755b39&w=1380';

    return Scaffold(
      backgroundColor: AppColor.background2,
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search bar
              TextField(
                // controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColor.background3,
                  suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/filterPage');
                      },
                      child: const Icon(Icons.filter_list_sharp,
                          color: Colors.grey)),
                  prefixIcon: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/searchFilter');
                      },
                      child: const Icon(Icons.search, color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: width * 1,
                height: height * 0.27,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage (
                        image: NetworkImage(offerImage), fit: BoxFit.fill)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/categoriesMore');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    // arrow to more
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              // categories listview builder
              SizedBox(
                // color: Colors.black,
                  height: height * 0.13,
                  width: width * 1,
                  child: const CategoriesCard()),
              //
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Featured products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
             const  Padding(
                padding:  EdgeInsets.only(bottom: 10.0),
                child: ProductCard(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
