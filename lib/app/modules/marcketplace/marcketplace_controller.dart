import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../data/remote/api_call_status.dart';
import '../../data/remote/base_client.dart';

class MarcketplaceController extends GetxController {
  String type = 'Tous';
  void changeType(String newType) {
    type = newType;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
