import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/core/constants/colorConstants.dart';



class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.icon, required this.text,});
    final String icon;
    final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.only(top: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(icon,
                color: AppColor.primaryDark,
                    ),
            ),
            const SizedBox(width: 15,),
            Text(text,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_sharp,size: 18,color: AppColor.text1,)
          ],
        ),
      ),
    );
  }
}
