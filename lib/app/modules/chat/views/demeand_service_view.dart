import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/components/custom_text.dart';
import 'package:getx_skeleton/app/components/custom_text_form_field.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

import '../chat_controller.dart';
import 'upload_file.dart';

class DemeandServiceView extends StatelessWidget {
  DemeandServiceView({super.key});
  RadioGroupController myController = RadioGroupController();
  RadioGroupController myController2 = RadioGroupController();
  ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(txt: "Formulaire de demande de service"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txt: 'Formulaire de recyclage',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              32.verticalSpace,
              CustomText(
                txt: 'Remplissez le formulaire',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 63, 63, 63),
              ),
              16.verticalSpace,
              Text(
                """Pourriez-vous remplir le formulaire ci-dessous, pour remettre les poubelles à un lieu affilié ?\nvous pouvez attendre jusqu'à 5 jours pour que votre commande soit expédiée. nous avons apprécié vos patients""",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  height: 2,
                ),
              ),
              64.verticalSpace,
              CustomTextFormField(
                label: 'Nom et Prénom',
              ),
              64.verticalSpace,
              CustomText(txt: 'Type de déchet*'),
              16.verticalSpace,
              RadioGroup(
                key: GlobalKey(),
                controller: myController,
                values: [
                  "Bouteilles en plastique",
                  "Carton & papier",
                  "Fer",
                  "Aluminum",
                  "Glass",
                  "Electronic",
                ],
                indexOfDefault: 0,
                orientation: RadioGroupOrientation.vertical,
                decoration: RadioGroupDecoration(
                  spacing: 10.0,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  activeColor: LightThemeColors.primaryColor,
                ),
              ),
              64.verticalSpace,
              CustomText(txt: "l' équipe*"),
              16.verticalSpace,
              RadioGroup(
                key: GlobalKey(),
                controller: myController2,
                values: [
                  "Matin (08:00 - 10:59)",
                  "Midi (11:00 - 13:59)",
                  "Après-midi (14:00 - 16:00)",
                ],
                indexOfDefault: 0,
                orientation: RadioGroupOrientation.vertical,
                decoration: RadioGroupDecoration(
                  spacing: 10.0,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  activeColor: LightThemeColors.primaryColor,
                ),
              ),
              64.verticalSpace,
              CustomTextFormField(
                label: 'Date et heure',
              ),
              32.verticalSpace,
              CustomTextFormField(
                label: 'Poids estimé*',
              ),
              32.verticalSpace,
              CustomTextFormField(
                label: 'Informations supplémentaires (facultatif)',
              ),
              32.verticalSpace,
              CustomTextFormField(
                label: "Prix ​​offert en DZD",
              ),
              32.verticalSpace,
              GetBuilder<ChatController>(
                builder: (_) {
                  return FileCard(
                    name: "Attachement",
                    onTap: () {
                      chatController.uploadFile();
                    },
                    file: chatController.file,
                  );
                },
              ),
              32.verticalSpace,
              GetBuilder<ChatController>(builder: (_) {
                return Row(
                  children: [
                    Checkbox(
                        value: chatController.isAprroved,
                        activeColor: LightThemeColors.primaryColor,
                        onChanged: (v) {
                          print(v);
                          chatController.approve();
                        }),
                    Expanded(
                      child: CustomText(
                        txt:
                            "Je suis d'accord avec toutes les données fournies",
                        fontSize: 12.sp,
                        color: LightThemeColors.bodyTextColor,
                      ),
                    )
                  ],
                );
              }),
              CustomButton(
                child: CustomText(
                  txt: "Envoyer",
                  color: Colors.white,
                ),
                width: double.infinity,
                borderRadius: 16.r,
                high: 50.h,
                onPressed: () {
                  Get.back();
                  Get.back();
                  CustomSnackBar.showCustomSnackBar(
                    title: "Success",
                    message: "Voter Formulaire a bien envoyé",
                  );
                },
                color: LightThemeColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
