import 'package:flutter/material.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';

import '../../products_list/products_list.dart';


class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({super.key});

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  @override
  Widget build(BuildContext context) {
    int favoriteCount = products.where((product) => product['favorite'] == true).toList().length;

    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: const Text('Favorite',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
    body:Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,top: 26),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                itemCount: favoriteCount,
                itemBuilder: (context,index){
                  final items = products[index];
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/productPage',arguments:items);
                    },
                    child: Dismissible(key: Key(products.toString()),
                        onDismissed: (direction){
                          setState(() {
                            items['favorite'] = !items[
                            'favorite'];
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20), // Background color when swiping
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        child: Container(
                          height: ScreenSize.height * 0.12,
                          width: ScreenSize.width * 1,
                          decoration: BoxDecoration(
                              color: AppColor.background1,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:const EdgeInsets.symmetric(horizontal: 12),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: ScreenSize.width * 0.22,
                                  height: ScreenSize.height * 0.1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(items['background'])
                                    ),
                                    shape: BoxShape.circle
                                  ),
                                  child: Image.asset(items['product_image'],fit:BoxFit.fitWidth,),
                                ),
                                SizedBox(
                                  width:ScreenSize.width * 0.09,
                                ),
                                // items name and price
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$ ${items['price']}',
                                      style:  const TextStyle(color:AppColor.primaryDark,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    Text(items['name'],
                                        style:  const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text(items['product_type'],
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12))
                                  ],
                                ),
                                const Spacer(),
                                // adding and --
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          items['qty']++;
                                        });
                                      },
                                      child:  const Icon(
                                        Icons.add,
                                        color:AppColor.primaryDark,
                                      ),
                                    ),
                                    Text(
                                      items['qty'].toString(),
                                      style:  const TextStyle(
                                          color: AppColor.text1,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          if(items['qty']>0){
                                            items['qty']--;
                                          }
                                        });
                                      },
                                      child:  const Icon(
                                        Icons.remove,
                                        color:AppColor.primaryDark,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )

                            ,),
                    )),
                  )
                ),
              );
            }),
          ),
        ],
      ),
    ),
    );
  }
}
