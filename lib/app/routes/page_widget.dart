import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/api_widgets/some_thing_error.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/components/custom_text.dart';

class PageWidget extends StatelessWidget {
  PageWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.color,
    required this.next,
  });

  final String title;
  final String description;
  final String image;
  final Color color;
  Function next;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
        ),
        child: SizedBox(
          width: Get.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                child: SizedBox(
                  height: Get.height * 0.7,
                  width: Get.width,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  height: Get.height * 0.7,
                  width: Get.width,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Image.asset(
                      'assets/images/onboarding.png',
                      color: color,
                      fit: BoxFit.fitWidth,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Spacer(),
                        CustomText(
                          txt: title,
                          maxLine: 3,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          fontSize: 24.sp,
                        ),
                        32.verticalSpace,
                        Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: CustomText(
                            txt: description,
                            maxLine: 3,
                            textAlign: TextAlign.center,
                            color: Colors.white,
                          ),
                        ),
                        32.verticalSpace,
                        CustomButton(
                          child: Text("Suivent".tr),
                          width: Get.width * 0.8,
                          borderRadius: 16.r,
                          high: Get.height * 0.07,
                          onPressed: () => next(),
                        ),
                        32.verticalSpace,
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
