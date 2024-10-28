import 'package:get/get.dart';

import './marcketplace_controller.dart';

class MarcketplaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarcketplaceController>(
      () => MarcketplaceController(),
    );
  }
}
