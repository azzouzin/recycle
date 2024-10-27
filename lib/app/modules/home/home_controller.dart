import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../data/remote/api_call_status.dart';
import '../../data/remote/base_client.dart';

class HomeController extends GetxController {
  // hold data coming from api
  List<Map<dynamic, dynamic>> data = [];

  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // getting data from api
  getData() async {
    // *) perform api call
    Future.delayed(const Duration(seconds: 2)).then((value) {
      apiCallStatus = ApiCallStatus.success;
      update();
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
