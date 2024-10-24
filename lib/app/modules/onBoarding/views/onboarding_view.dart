import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_text.dart';
import 'package:getx_skeleton/app/routes/routes.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:onboarding/onboarding.dart';

import '../../../data/local/shared_pref.dart';
import '../../../routes/page_widget.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late Material materialButton;

  late List<Widget> pages;
  @override
  void initState() {
    super.initState();

    pages = [
      PageWidget(
        title: "Plateforme de mise en relation (Marketplace) ",
        description:
            "Annuaire des collecteurs et recycleurs : Une base de données avec les profils des collecteurs et des recycleurs/transformateurs",
        image: "assets/images/onboarding1.png",
        color: Colors.blue,
        next: goNext,
      ),
      PageWidget(
        title: "Demande de service et planification ",
        description:
            "Formulaire de demande de collecte : Les entreprises ou particuliers peuvent soumettre une demande pour qu'un collecteur vienne récupérer leurs déchets plastiques.",
        image: "assets/images/onboarding2.png",
        color: Get.theme.primaryColor,
        next: goNext,
      ),
      PageWidget(
        title: "Suivi en temps réel ",
        description:
            "Système de points ou de bonus : Collecteurs et recycleurs peuvent recevoir des points pour des transactions réussies, ou atteindre des objectifs écologiques comme le recyclage de X tonnes de plastique",
        image: "assets/images/onboarding3.png",
        color: Get.theme.colorScheme.secondary,
        next: goNext,
      ),
      PageWidget(
        title: "Récompenses et motivation",
        description:
            "Système de points ou de bonus : Collecteurs et recycleurs peuvent recevoir des points pour des transactions réussies, ou atteindre des objectifs écologiques comme le recyclage de X tonnes de plastique",
        image: "assets/images/onboarding4.png",
        color: Colors.blueAccent,
        next: goNext,
      ),
    ];
  }

  // void redirectUser() {
  //   print(SharedPref.getOnBoarding());
  //   if (SharedPref.getOnBoarding()) Get.toNamed(Routes.HOME);
  // }

  void goNext() {
    if (liquidController.currentPage < pages.length - 1) {
      liquidController.animateToPage(
        page: pages.indexOf(pages[liquidController.currentPage + 1]),
      );
    } else {
      SharedPref.setOnBoarding(true);
      Get.toNamed(Routes.HOME);
    }
  }

  LiquidController liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    //  redirectUser();
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        liquidController: liquidController,
        fullTransitionValue: 600, // The speed of the swipe transition
        enableLoop: true, // Allows looping the swipe
        waveType: WaveType.liquidReveal, // Adds the liquid effect
      ),
    );
  }
}
