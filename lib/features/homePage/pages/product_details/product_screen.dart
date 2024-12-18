import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/core/mediaQuery/mediaQuery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final imageUrl = [
      data['images']['image-1'],
      data['images']['image-2'],
      data['images']['image-3'],
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Image Carousel Section with Back Button
            SizedBox(
              height: height * 0.4, // 40% of screen height
              child: Stack(
                children: [
                  // Image Carousel
                  SizedBox(
                    height: double.infinity,
                    // color: Colors.red,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount: imageUrl.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = imageUrl[index];
                        return buildImage(urlImage);
                      },
                      options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  // Back Button
                  Positioned(
                    top: 10,
                    left: 16,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  // Page Indicator
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: buildIndicator(imageUrl.length),
                    ),
                  ),
                ],
              ),
            ),
            // Product Details Section
            Expanded(
              child: Container(
                color: const Color(0xFFF4F5F9),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Price and Favorite Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${data['price']}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF6CC51D),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                data['favorite'] = !data['favorite'];
                              });
                            },
                            child: Icon(
                              data['favorite']
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: data['favorite'] ? Colors.red : Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      // Product Name and Type
                      Text(
                        data['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        data['product_type'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      // Rating Section
                      Row(
                        children: const [
                          Text(
                            '4.5  ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 15,
                          ),
                          Text(
                            ' (89 reviews)',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      // Product Description
                      const Text(
                        'Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world\'s finest lemon for juicing.',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      // Quantity Selector
                      Container(
                        width: width * 1,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Text(
                                'Quantity',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    data['qty']--;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 12.83,
                                  color: Color(0xFF6CC51D),
                                ),
                              ),
                              VerticalDivider(
                                color: const Color(0xFFEBEBEB),
                                thickness: 1,
                                width: 20,
                                indent: 1,
                                endIndent: 1,
                              ),
                              Text(
                                data['qty'].toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              VerticalDivider(
                                color: const Color(0xFFEBEBEB),
                                thickness: 1,
                                width: 20,
                                indent: 1,
                                endIndent: 1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    data['qty']++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 12.83,
                                  color: Color(0xFF6CC51D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Add to Cart Button
                      Container(
                        width: width * 1,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6CC51D),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(int count) => AnimatedSmoothIndicator(
    effect: const ExpandingDotsEffect(
      dotWidth: 5,
      dotHeight: 5,
      activeDotColor: Color(0xFF6CC51D),
    ),
    activeIndex: activeIndex,
    count: count,
  );

  Widget buildImage(String urlImage) {
    return Container(
      // height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: Image.network(
        urlImage,
        fit: BoxFit.fill, // Ensures the image covers the full container height
      ),
    );
  }
}
