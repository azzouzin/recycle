import 'package:get/get.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/onBoarding/views/onboarding_view.dart';
import 'routes.dart';
import '../modules/onboarding/onboarding_binding.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
  ];
}
