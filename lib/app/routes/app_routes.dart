    import 'package:get/get.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/onBoarding/views/onboarding_view.dart';
import 'routes.dart';
import '../modules/onboarding/onboarding_binding.dart';
import 'routes.dart';
import '../modules/marcketplace/marcketplace_binding.dart';
import '../modules/marcketplace/marcketplace_view.dart';
import 'routes.dart';
import '../modules/maps/maps_binding.dart';
import '../modules/maps/maps_view.dart';
import 'routes.dart';
import '../modules/chat/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import 'routes.dart';
import '../modules/recompense/recompense_binding.dart';
import '../modules/recompense/recompense_view.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    
    
    
    
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
  
    GetPage(
      name: Routes.MARCKETPLACE,
      page: () =>  MarcketplaceView(),
      binding: MarcketplaceBinding(),
    ),
   
    GetPage(
      name: Routes.MAPS,
      page: () => const MapsView(),
      binding: MapsBinding(),
    ),
   
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
   
    GetPage(
      name: Routes.RECOMPENSE,
      page: () => const RecompenseView(),
      binding: RecompenseBinding(),
    ),
   ];
}
