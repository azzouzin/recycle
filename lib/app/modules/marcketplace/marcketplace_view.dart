import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_text_form_field.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../components/custom_text.dart';
import './marcketplace_controller.dart';
import 'views/adds_item.dart';

class MarcketplaceView extends GetView<MarcketplaceController> {
  const MarcketplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          txt: 'marcketplaceView',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leading: const SizedBox(),
        actions: [
          Icon(
            Iconsax.copyright,
            color: LightThemeColors.primaryColor,
          )
        ],
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: CustomTextFormField(
                hintTxt: 'Recherche',
                suffixIcon: Icon(
                  Iconsax.search_favorite,
                  color: LightThemeColors.primaryColor,
                ),
              ),
            ),
            8.verticalSpace,
            SizedBox(
              height: 200.h,
              width: Get.width * 0.95,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    16.horizontalSpace,
                    AdsItem(
                      imageUrl: 'assets/images/plastiques.jpg',
                      adsUrl: "assets/vectors/grabModel.svg",
                    ),
                    16.horizontalSpace,
                    AdsItem(
                      imageUrl: 'assets/images/plastiques2.jpg',
                      adsUrl: "assets/vectors/grabModel1.svg",
                    ),
                    16.horizontalSpace,
                    AdsItem(
                      imageUrl: 'assets/images/plastiques3.jpg',
                      adsUrl: "assets/vectors/grabModel2.svg",
                    ),
                    // 16.horizontalSpace,
                    // AdsItem(
                    //   imageUrl: 'assets/images/plastiques.png',
                    //   adsUrl: "assets/vectors/grabModel.svg",
                    // ),
                  ],
                ),
              ),
            ),
            16.verticalSpace,
            Row(
              children: [
                16.horizontalSpace,
                CustomText(
                  txt: "Les Categories",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: LightThemeColors.bodyTextColor,
                ),
                Spacer(),
                CustomText(
                  txt: "voir tous",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: LightThemeColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
                16.horizontalSpace,
              ],
            ),
            16.verticalSpace,
            SizedBox(
              height: 60.h,
              width: Get.width * 0.95,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(8.r),
                        color: LightThemeColors.primaryColor,
                      ),
                      child: CustomText(
                        txt: "Collecteurs",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
