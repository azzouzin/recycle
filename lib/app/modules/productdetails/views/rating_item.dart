
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_text.dart';

class ProductRatingItem extends StatelessWidget {
  const ProductRatingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.3,
            color: Colors.grey,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/icon1.png"),
          8.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txt: "4.5",
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                txt: "Plastique",
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
