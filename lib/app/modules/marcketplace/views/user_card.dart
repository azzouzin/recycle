import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:faker/faker.dart' as faker;

import '../../../../config/theme/light_theme_colors.dart';
import '../../../components/custom_text.dart';
import '../../../routes/routes.dart';

class UserCard extends StatelessWidget {
  UserCard({
    super.key,
    required this.isRecycle,
  });
  bool isRecycle;
  final myFaker = faker.Faker();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CHAT);
      },
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.h,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                myFaker.image.image(random: true),
                fit: BoxFit.cover,
              ),
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                txt: faker.Person(faker.random).firstName() +
                    " " +
                    faker.Person(faker.random).lastName(),
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: LightThemeColors.bodyTextColor,
              ),
              8.verticalSpace,
              CustomText(
                txt: faker.Address(faker.Person(faker.random)).city(),
                fontSize: 14.sp,
                fontWeight: FontWeight.w100,
                color: Colors.blueGrey,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                txt: !isRecycle ? "Collecteur" : "Recycleur",
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color:
                    !isRecycle ? Colors.orange : LightThemeColors.primaryColor,
              ),
              8.verticalSpace,
              Icon(
                !isRecycle ? Icons.fire_truck : Icons.recycling_outlined,
                color:
                    !isRecycle ? Colors.orange : LightThemeColors.primaryColor,
              ),
            ],
          ),
          16.horizontalSpace,
        ],
      ),
    );
  }
}
