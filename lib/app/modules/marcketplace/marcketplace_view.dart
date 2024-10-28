import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './marcketplace_controller.dart';

class MarcketplaceView extends GetView<MarcketplaceController> {
  const MarcketplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("marcketplaceView"),
      ),
    );
  }
}
