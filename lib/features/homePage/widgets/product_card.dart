import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/mediaQuery/mediaQuery.dart';
import '../products_list/products_list.dart';



class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      shrinkWrap: true,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // Number of items in each row
          crossAxisSpacing: 5,
          // Horizontal space between items
          mainAxisSpacing: 10,
          // Vertical space between items
          // childAspectRatio: 3 / 4, // Aspect ratio of each item
          mainAxisExtent: 250),
      itemBuilder: (context, index) {
        final items = products[index];
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6)),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                Navigator.pushNamed(context, '/productPage',arguments:items);
                },
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        // new section
                        SizedBox(
                            child: items['new'].toString().isEmpty?const SizedBox():Container(
                              width: width * 0.08,
                              height: height * 0.02,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFFFDEFD5),
                              ),
                              child: Center(
                                  child: Text(
                                    items['new'],
                                    style: const TextStyle(
                                        color: Color(0xFFE8AD41),
                                        fontSize: 10),
                                  )),
                            )
                        ),
                        // offer section
                        SizedBox(
                            child: items['new'].toString().isEmpty?const SizedBox():const SizedBox(height: 2,)),
                        SizedBox(
                            child: items['offer'].toString().isEmpty? SizedBox(
                              width: width * 0.08,
                              height: height * 0.02,
                            ):Container(
                              width: width * 0.08,
                              height: height * 0.02,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFFFEE4E4),
                              ),
                              child: Center(
                                  child: Text(
                                    '-${items['offer']}%',
                                    style: const TextStyle(
                                        color: Color(0xFFF56262),
                                        fontSize: 10),
                                  )),
                            )
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 84,
                          width: 84,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      items['background']),
                                  fit: BoxFit.fill)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                items['product_image']),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          '\$ ${items['price']}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        SizedBox(
                          // height: 20,
                          width: 92,
                          child: Text(
                            '${items['name']}',
                            maxLines: 1,
                            // Maximum lines
                            overflow: TextOverflow.ellipsis,
                            // Adds "..." if text overflows
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          items['product_type'],
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            items['favorite'] = !items[
                            'favorite']; // Toggle between true and false
                          });
                        },
                        child: Icon(
                          items['favorite']
                              ? Icons.favorite_outlined
                              : Icons.favorite_border,
                          size: 18,
                          color: items['favorite']
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // counting and add cart
              const Divider(
                height: 0,
                thickness: 0.5,
                color: Colors.grey,
              ),
              SizedBox(
                child: items['qty'] == 0
                    ? Padding(
                  padding:
                  const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        items['qty']++;
                      });
                    },
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            'assets/icons/Vector 2.svg',
                            width: 16),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontWeight:
                              FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              items['qty']--;
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.green,
                          )),
                      Text(items['qty'].toString()),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              items['qty']++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.green,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );

  }
}
