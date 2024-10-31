import 'package:faker/faker.dart' as fk;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/api_widgets/some_thing_error.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/components/custom_text.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';

import './productdetails_controller.dart';
import 'views/rating_item.dart';

class ProductdetailsView extends GetView<ProductdetailsController> {
  ProductdetailsView({super.key});
  String name = Get.arguments["name"];
  String image = Get.arguments["image"];
  int price = Get.arguments["price"];
  String description = Get.arguments["description"];
  String type = Get.arguments["type"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductdetailsController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300.h,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.verticalSpace,
                        Row(
                          children: [
                            CustomText(
                              txt: name,
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                controller.decreaseQte();
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 206, 206, 206),
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                            ),
                            16.horizontalSpace,
                            CustomText(
                              txt: controller.qte.toString(),
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            16.horizontalSpace,
                            InkWell(
                              onTap: () {
                                controller.increaseQte();
                              },
                              child: CircleAvatar(
                                backgroundColor: LightThemeColors.accentColor,
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                          ],
                        ),
                        8.verticalSpace,
                        CustomText(
                          txt: price.toString() + " DZD / KG",
                          color: LightThemeColors.primaryColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        16.verticalSpace,
                        Text(
                          description,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductRatingItem(
                                  title: "Type",
                                  description: type,
                                  icon: "assets/images/icon1.png",
                                ),
                                ProductRatingItem(
                                  title: "Satisfaisant",
                                  description: "100 %",
                                  icon: "assets/images/icon2.png",
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductRatingItem(
                                  title: "Recyclé",
                                  description: "90 %",
                                  icon: "assets/images/icon3.png",
                                ),
                                ProductRatingItem(
                                  title: "ٌRating",
                                  description: "100 %",
                                  icon: "assets/images/icon4.png",
                                ),
                              ],
                            )
                          ],
                        ),
                        CustomButton(
                            onPressed: () {
                              Get.back();
                              CustomSnackBar.showCustomSnackBar(
                                title: 'Succes',
                                message: 'Commande ajoute avec succes',
                              );
                            },
                            color: LightThemeColors.primaryColor,
                            width: Get.width,
                            borderRadius: 16.r,
                            high: 55.h,
                            child: CustomText(
                              txt: "Ajouter au panier",
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
