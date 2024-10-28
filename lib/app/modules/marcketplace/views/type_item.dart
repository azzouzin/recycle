import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/marcketplace/marcketplace_controller.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../components/custom_text.dart';

class TypeItem extends StatelessWidget {
  TypeItem({
    super.key,
    required this.isSelcted,
    required this.type,
  });
  bool isSelcted;
  String type;
  MarcketplaceController marcketplaceController =
      Get.put(MarcketplaceController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        marcketplaceController.changeType(type);
      },
      child: Container(
        width: Get.width * 0.25,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(8.r),
          color: isSelcted ? LightThemeColors.primaryColor : Colors.white,
        ),
        child: CustomText(
          txt: type,
          color: !isSelcted ? LightThemeColors.primaryColor : Colors.white,
        ),
      ),
    );
  }
}
