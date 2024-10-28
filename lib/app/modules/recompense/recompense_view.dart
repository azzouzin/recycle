import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './recompense_controller.dart';

class RecompenseView extends GetView<RecompenseController> {
  const RecompenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RecompenseController>(
        builder: (controller) {
         return const Center(child: Text("recompenseView"));
        },
      ),
    );
  }
}
    