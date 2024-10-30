import 'package:get/get.dart';

import './materials_controller.dart';

class MaterialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaterialsController>(
      () => MaterialsController(),
    );
  }
}
