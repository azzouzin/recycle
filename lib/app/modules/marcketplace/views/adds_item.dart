import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AdsItem extends StatelessWidget {
   AdsItem({
    super.key,
    required this.adsUrl,
    required this.imageUrl
  });
  final String adsUrl;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16.r), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        )
      ]),
      child: SizedBox(
        height: 150.h,
        width: Get.width * 0.7,
        child: Stack(children: [
          SizedBox(
            // height: 140.h,
            // width: Get.width * 0.4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(imageUrl)),
          ),
          SvgPicture.asset(
            adsUrl,
            fit: BoxFit.fitHeight,
            // height: 140.h,
            // width: Get.width * 0.4,
          ),
        ]),
      ),
    );
  }
}
