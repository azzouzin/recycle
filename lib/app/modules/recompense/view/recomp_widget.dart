import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rive/rive.dart' as rive;

import '../../../components/custom_button.dart';
import '../../../components/custom_text.dart';

class RecompWidget extends StatelessWidget {
  RecompWidget({
    super.key,
    required this.urlImage,
    required this.points,
    required this.title,
    required this.desc,
  });
  String urlImage;
  String points;
  String title;
  String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      // height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.fitWidth,
          ),
          // 16.verticalSpace,
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  txt: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  txt: desc,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                16.verticalSpace,
                Row(children: [
                  Icon(
                    Iconsax.dollar_circle,
                    color: LightThemeColors.primaryColor,
                  ),
                  CustomText(
                    txt: points,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  // 16.horizontalSpace,
                  Spacer(),
                  CustomButton(
                    color: LightThemeColors.primaryColor,
                    child: CustomText(
                      txt: "Echanger",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 56, 56, 56),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 200.h,
                                    width: 200.w,
                                    child: rive.RiveAnimation.asset(
                                      'assets/vectors/done.riv',
                                    ),
                                  ),
                                  16.verticalSpace,
                                  CustomText(
                                    txt: "Echange effectue avec succes",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    width: 100.w,
                    high: 40.h,
                    borderRadius: 8.r,
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
