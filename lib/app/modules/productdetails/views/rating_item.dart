import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_text.dart';

class ProductRatingItem extends StatelessWidget {
  ProductRatingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });
  String icon;
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 150.w,
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
          Image.asset(icon),
          8.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txt: title,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                txt: description,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
