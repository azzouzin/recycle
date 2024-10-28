import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/api_widgets/some_thing_error.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:iconsax/iconsax.dart';

import '../../../config/theme/light_theme_colors.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_form_field.dart';
import './recompense_controller.dart';
import 'view/recomp_widget.dart';

class RecompenseView extends GetView<RecompenseController> {
  const RecompenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          txt: 'Récompenses et motivation',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leading: const SizedBox(),
        actions: [],
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: GetBuilder<RecompenseController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  16.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: CustomTextFormField(
                      hintTxt: 'Recherche',
                      suffixIcon: Icon(
                        Iconsax.search_favorite,
                        color: LightThemeColors.primaryColor,
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  RecompWidget(
                    urlImage: 'assets/images/recomp1.png',
                    title: 'Convertés en Go pay',
                    desc:
                        'vous pouvez échanger des points avec des actifs go pay',
                    points: '10 000 points',
                  ),
                  16.verticalSpace,
                  RecompWidget(
                    urlImage: 'assets/images/recomp2.png',
                    title: 'Convertés en Go pay',
                    desc:
                        'vous pouvez échanger des points avec des actifs go pay',
                    points: '5 000 points',
                  ),
                  16.verticalSpace,
                  RecompWidget(
                    urlImage: 'assets/images/recomp3.png',
                    title: 'Convertés en Go pay',
                    desc:
                        'vous pouvez échanger des points avec des actifs go pay',
                    points: '70 000 points',
                  ),
                  16.verticalSpace,
                  RecompWidget(
                    urlImage: 'assets/images/recomp4.png',
                    title: 'Convertés en Go pay',
                    desc:
                        'vous pouvez échanger des points avec des actifs go pay',
                    points: '22 000 points',
                  ),
                  16.verticalSpace,
                  RecompWidget(
                    urlImage: 'assets/images/recomp6.png',
                    title: 'Convertés en Go pay',
                    desc:
                        'vous pouvez échanger des points avec des actifs go pay',
                    points: '100 000 points',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
