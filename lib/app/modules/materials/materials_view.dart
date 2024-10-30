import 'package:faker/faker.dart' as fk;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/routes.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';

import '../../components/custom_text.dart';
import './materials_controller.dart';

class MaterialsView extends GetView<MaterialsController> {
  MaterialsView({super.key});
  List<String> materials = [
    "Bouteilles \nen plastique",
    "Carton \n& papier",
    "Fer",
    "Aluminum",
    "Glass",
    "Electronic",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomText(
        txt: "Les Matériaux recyclés",
        color: Colors.white,
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.verticalSpace,
            Text(
              "Marketplace de matériaux recyclés : Une section dédiée à l’achat/vente de plastique recyclé",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            32.verticalSpace,
            Row(children: [
              CustomText(
                txt: "Les Categories",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              Spacer(),
              CustomText(
                txt: "voir plus",
                color: LightThemeColors.primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontSize: 12.sp,
              ),
            ]),
            16.verticalSpace,
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //    crossAxisCount: 3),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    //  onTap: () => getFunction[index](),
                    child: Column(
                      children: [
                        Container(
                          height: 70.h,
                          width: 70.w,
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //  borderRadius: BorderRadius.circular(8.r),
                            shape: BoxShape.circle,
                          ),
                          child: SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: CircleAvatar(
                              //borderRadius: BorderRadius.circular(300.r),
                              child: Image.asset(
                                "assets/images/m${index + 1}.jpg",
                              ),
                            ),
                          ),
                        ),
                        CustomText(
                          txt: materials[index],
                          color: Colors.black,
                          fontSize: 12.sp,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final name = materials[fk.random.integer(5)];
                  final type = "plastic";
                  final price = fk.Faker().randomGenerator.integer(1000);
                  final description =
                      "Le plastique recyclé est un plastique transformé à partir de produits plastiques usagés ou jetés. Il permet de réduire les déchets, de préserver les ressources et de minimiser l'impact environnemental en donnant une nouvelle vie aux matériaux. Couramment utilisé dans l'emballage, le mobilier et les textiles, le plastique recyclé contribue à une économie circulaire en réutilisant des matériaux existants.";
                  final image = fk.Faker().image.image(random: true);
                  return Container(
                    height: 400.h,
                    width: 150.w,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      //   shape: BoxShape.circle,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: 150.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        16.verticalSpace,
                        CustomText(
                          txt: name,
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                        Row(
                          children: [
                            CustomText(
                              txt: "$price DZD",
                              color: Colors.black,
                              fontSize: 12.sp,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.PRODUCTDETAILS, arguments: {
                                  "name": name,
                                  "type": type,
                                  "price": price,
                                  "description": description,
                                  "image": image,
                                });
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: LightThemeColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
