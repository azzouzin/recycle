import 'package:get/get.dart';

import './recompense_controller.dart';

class RecompenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecompenseController>(
      () => RecompenseController(),
    );
  }
}
