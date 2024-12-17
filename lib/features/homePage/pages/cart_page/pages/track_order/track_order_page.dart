import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../../../core/constants/colorConstants.dart';
import '../../../../../../core/constants/imageContstants.dart';
import '../../../../../../core/mediaQuery/mediaQuery.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2,
      appBar: AppBar(
        backgroundColor: AppColor.background1,
        title: const Text(
          'Track Order',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 22),
          child: Column(
            children: [
              // Order Summary Section
              Container(
                padding: const EdgeInsets.all(12),
                height: ScreenSize.height * 0.13,
                width: ScreenSize.width * 1,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 66,
                      decoration: const BoxDecoration(
                        color: AppColor.primaryLight,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          IconConstants.boxIcon,
                          width: 32,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #90897 ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          'Placed on October 19, 2021',
                          style: TextStyle(color: AppColor.text1, fontSize: 10),
                        ),
                        Row(
                          children: [
                            Text(
                              'Items: 10',
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Total: \$16.90',
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Timeline Section
              Container(
                padding:const  EdgeInsets.only(left: 10,right: 0,top: 10),
                height: ScreenSize.height*0.65,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTimelineTile(
                      isFirst: true,
                      icon: IconConstants.checkedIcon,
                      title: 'Order Placed',
                      subtitle: 'October 21, 2021',
                      color: AppColor.primaryLight,
                    ),
                    buildTimelineTile(
                      icon: IconConstants.openBoxIcon,
                      title: 'Order Confirmed',
                      subtitle: 'October 22, 2021',
                      color: AppColor.primaryLight,
                    ),
                    buildTimelineTile(
                      icon: IconConstants.trackingIcon,
                      title: 'Order Shipped',
                      subtitle: 'October 22, 2021',
                      color: AppColor.primaryLight,
                    ),
                    buildTimelineTile(
                      icon: IconConstants.deliveryIcon,
                      title: 'Out for Delivery',
                      subtitle: 'pending',
                      color: AppColor.background3,
                    ),
                    buildTimelineTile(
                      isLast: true,
                      icon: IconConstants.deliveredIcon,
                      title: 'Delivered',
                      subtitle: 'Pending',
                      color: AppColor.background3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Timeline Tile Builder
  Widget buildTimelineTile({
    required String icon,
    required String title,
    required String subtitle,
    required Color color,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0.1,
        width: 66,
        height: 66,
        indicator: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 32,
            ),
          ),
        ),
      ),
      beforeLineStyle: const LineStyle(
        color: AppColor.text1,
        thickness: 1,
      ),
      afterLineStyle: const LineStyle(
        // color: isLast ? Colors.transparent : AppColor.primaryLight,
        thickness: 1,
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 16,top: 16,bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: AppColor.text1, fontSize: 12),
            ),
            const SizedBox(height: 15,),
            const SizedBox(
              child: Divider(
                height: 20,
                color: AppColor.text1,
                thickness: 0.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
