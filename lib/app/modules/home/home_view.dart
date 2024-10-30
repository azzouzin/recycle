import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/api_handle_ui_widget.dart';
import 'package:getx_skeleton/app/components/api_widgets/some_thing_error.dart';
import 'package:getx_skeleton/app/components/custom_text.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/routes.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (_) {
          return ApiHandleUiWidget(
            successWidget: Stack(
              children: [
                Image.asset("assets/images/bghome.png"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("assets/images/bg2home.png"),
                    Expanded(
                      child: Container(
                        //  height: Get.height * 0.1,
                        color: const Color.fromARGB(255, 255, 240, 240),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      64.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        height: Get.height * 0.1,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            8.horizontalSpace,
                            Container(
                              height: 60.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                child:
                                    Image.asset("assets/images/persone1.png"),
                              ),
                            ),
                            16.horizontalSpace,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  txt: "Merouani Azzouz",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                                CustomText(
                                  txt: "Bienvenue a l'application",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      120.verticalSpace,
                      CustomText(
                        txt: "Points",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      8.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.dollar_circle,
                            color: LightThemeColors.primaryColor,
                          ),
                          8.horizontalSpace,
                          CustomText(
                            txt: "Votre points récompenses ",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            txt: " : 100",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => getFunction[index](),
                                  child: Container(
                                    height: 80.h,
                                    width: 80.w,
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r),
                                      //    shape: BoxShape.circle,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/vectors/${index + 1}.svg"),
                                        CustomText(
                                          txt: getText[index],
                                          fontSize: 12.sp,
                                          color: const Color.fromARGB(
                                            255,
                                            151,
                                            151,
                                            151,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            apiCallStatus: controller.apiCallStatus,
          );
        },
      ),
    );
  }

  List<Function> getFunction = [
    () => Get.toNamed(Routes.MARCKETPLACE),
    () => Get.toNamed(Routes.MAPS),
    () => Get.toNamed(Routes.RECOMPENSE),
    () => Get.toNamed(Routes.MATERIALS),
    // () => Get.toNamed(Routes.POINTS),
  ];

  List<String> getText = [
    "Marketplace",
    "Gps",
    "Récompenses",
    "Matériaux recyclés ",
    "Points ",
  ];
}
