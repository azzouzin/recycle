import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/api_widgets/some_thing_error.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/components/custom_text.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:maps_launcher/maps_launcher.dart';
import './maps_controller.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          CustomText(
            txt: "Réseau des collecteurs et recycleurs",
            fontSize: 14.sp,
            color: LightThemeColors.primaryColor,
          ),
          16.verticalSpace,
          CustomText(
            txt: "Recherche en cours...",
            fontSize: 24.sp,
            color: LightThemeColors.primaryColor,
          ),
          16.verticalSpace,
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/maps.png",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  onPressed: () async {
                    final Position? position =
                        await controller.getCurrentLocation();
                    position == null
                        ? null
                        : MapsLauncher.launchCoordinates(
                            position.latitude, position.longitude);
                  },
                  width: Get.width * 0.8,
                  borderRadius: 16.r,
                  color: LightThemeColors.primaryColor,
                  high: 50,
                  child: Text(
                    "Overire dans maps",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
