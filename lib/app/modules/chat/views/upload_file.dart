import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../components/custom_text.dart';

class FileCard extends StatelessWidget {
  FileCard({
    super.key,
    required this.onTap,
    required this.name,
    this.file,
  });
  File? file;
  Function() onTap;
  String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.sp),
        margin: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: file != null
            ? Container(
                height: Get.height * .1,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.file(file!)),
                    16.horizontalSpace,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          // ignore: prefer_interpolation_to_compose_strings
                          txt: (file!.lengthSync() / 1024 / 1024)
                                  .toStringAsFixed(2)
                                  .toString() +
                              ' ' +
                              "MB",
                          fontSize: 16.sp,
                          color: LightThemeColors.primaryColor,
                        ),
                        8.verticalSpace,
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.sp),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 201, 255, 199),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Iconsax.document_upload,
                                size: 16.sp,
                                color: Color.fromARGB(255, 70, 243, 54),
                              ),
                            ),
                            8.horizontalSpace,
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              height: 10.h,
                              width: 200.w,
                            )
                          ],
                        ),
                      ],
                    )),
                  ],
                ))
            : DottedBorder(
                color: LightThemeColors.bodySmallTextColor.withOpacity(0.5),
                borderType: BorderType.RRect,
                //    stackFit: StackFit.passthrough,
                dashPattern: [7, 7, 7, 7],
                strokeWidth: 3,
                radius: Radius.circular(12.r),
                strokeCap: StrokeCap.round,
                child: Container(
                  width: Get.width * 0.9,
                  height: Get.height * .25,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      32.verticalSpace,
                      Container(
                        padding: EdgeInsets.all(8.sp),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 200, 199, 255),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Iconsax.document_upload,
                          size: 32.sp,
                          color: const Color.fromARGB(255, 58, 54, 243),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: onTap,
                            child: CustomText(
                              txt: 'Click ici',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                          CustomText(
                            txt: 'Télécharger un fichier supplémentaire',
                            color: LightThemeColors.bodyTextColor,
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      CustomText(
                        txt: 'Support jpg, jpeg, png formats (10 mb)',
                        color: LightThemeColors.hintTextColor,
                        fontSize: 12.sp,
                      ),
                      16.verticalSpace,
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
