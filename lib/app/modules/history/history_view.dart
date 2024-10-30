import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/modules/history/history_controller.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:printing/printing.dart';
import '../../components/custom_text.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final ExportDelegate exportDelegate = ExportDelegate();

  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};
  final dashImages = [
    'assets/images/m1.jpg',
    'assets/images/m2.jpg',
    'assets/images/m3.jpg',
    'assets/images/m4.jpg',
    'assets/images/m5.jpg',
  ];

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrange,
          backgroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: CustomText(
            txt: 'Votre Commande Details',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.verticalSpace,
                      Row(
                        children: [
                          CustomText(
                            txt: 'Etape de Traitement',
                            fontSize: 16..sp,
                            fontWeight: FontWeight.bold,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              printTOPDF(exportDelegate);
                            },
                            child: CircleAvatar(
                                backgroundColor: LightThemeColors.accentColor,
                                child:
                                    Icon(Iconsax.printer, color: Colors.white)),
                          ),
                          10.horizontalSpace,
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: EasyStepper(
                          activeStep: activeStep,
                          lineStyle: const LineStyle(
                            lineLength: 80,
                            lineThickness: 1,
                            lineSpace: 5,
                          ),
                          //     direction: Axis.vertical,
                          stepRadius: 20,
                          unreachedStepIconColor: Colors.black87,
                          unreachedStepBorderColor: Colors.black54,
                          unreachedStepTextColor: Colors.black,
                          showLoadingAnimation: false,
                          steps: const [
                            EasyStep(
                              icon: Icon(Icons.my_location),
                              title: 'Commence',
                              lineText: '150 KM',
                            ),
                            EasyStep(
                              icon: Icon(CupertinoIcons.cube_box),
                              title: 'Préparation',
                              lineText: '150 KM',
                            ),
                            EasyStep(
                              icon: Icon(CupertinoIcons.map_pin),
                              title: 'Sétif',
                              lineText: '100 KM',
                            ),
                            EasyStep(
                              icon: Icon(CupertinoIcons.map_pin),
                              title: 'Kherrata',
                              lineText: '70 KM',
                            ),
                            EasyStep(
                              icon: Icon(CupertinoIcons.flag),
                              title: 'Béjaya',
                              lineText: 'Déstination',
                            ),
                          ],
                          onStepReached: (index) =>
                              setState(() => activeStep = index),
                        ),
                      ),
                      SizedBox(
                        height: 900.h,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Center(
                            child: Container(
                              width: 350.w,
                              margin: EdgeInsets.only(top: 100.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: const Offset(-3, -3),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: SizedBox(height: 850.h, child: bon()),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset("assets/images/done.png")),
                        ]),
                      ),
                    ])),
          ),
        ),
      ),
    );
  }

  void printTOPDF(ExportDelegate exportDelegate) async {
    // create instance of ExportDelegate

// export the frame to a PDF Document
    final pdf = await exportDelegate.exportToPdfDocument('myID');
    print(pdf);
    await Printing.layoutPdf(onLayout: (_) async => pdf.save());
// // export the frame to a PDF Page
//     final page = await exportDelegate.exportToPdfPage('someFrameId');

// // export the frame to a PDF Widget
//     final widget = await exportDelegate.exportToPdfWidget('someFrameId');
  }

  ExportFrame bon() {
    return ExportFrame(
      frameId: 'myID',
      exportDelegate: exportDelegate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          120.verticalSpace,
          CustomText(
            txt: 'En cours de Traitement',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          8.verticalSpace,
          CustomText(
            txt: '18 October 2022 • 09:30:00 WIB • No ref 181022S00069',
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          8.verticalSpace,
          Image.asset("assets/images/qr.png"),
          16.verticalSpace,
          myItemTextBon('N° Commande', '181022S00069', false),
          myItemTextBon('Nome et Prenom', 'Merouani Azzouz', false),
          myItemTextBon('N° Telephone', '+213 502 555 142', false),
          myItemTextBon('Email', 'azzouzmerw@gmail.com', false),
          Divider(color: Colors.black.withOpacity(0.1)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  txt: 'Details de la Commande',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 110, 110, 110),
                ),
              ],
            ),
          ),
          myItemTextBon('Bouteilles en plastique', '18 000 DZD', true),
          myItemTextBon("Carton papier", '9 000 DZD', true),
          myItemTextBon('Fer', '200 000 DZD', true),
          myItemTextBon('Aluminum', '150 000 DZD', true),
          myItemTextBon('Glass', '600 000 DZD', true),
          myItemTextBon('Electronic', '120 000 DZD', true),
          Divider(color: Colors.black.withOpacity(0.1)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  txt: 'Total de la Commande',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 110, 110, 110),
                ),
              ],
            ),
          ),
          myItemTextBon('Remise', '5 000 DZD', true),
          myItemTextBon('Points ganisés', '22 000 Points', true),
          myItemTextBon('Total', '11 106 000 DZD', true),
        ],
      ),
    );
  }

  Padding myItemTextBon(String title, String value, bool isColor) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            txt: title,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          CustomText(
            txt: value,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: isColor ? LightThemeColors.accentColor : Colors.grey,
          )
        ],
      ),
    );
  }

  bool _allowTabStepping(int index, StepEnabling enabling) {
    return enabling == StepEnabling.sequential
        ? index <= reachedStep
        : reachedSteps.contains(index);
  }

  /// Returns the next button.
  Widget _nextStep(StepEnabling enabling) {
    return IconButton(
      onPressed: () {
        if (activeStep2 < upperBound) {
          setState(() {
            if (enabling == StepEnabling.sequential) {
              ++activeStep2;
              if (reachedStep < activeStep2) {
                reachedStep = activeStep2;
              }
            } else {
              activeStep2 =
                  reachedSteps.firstWhere((element) => element > activeStep2);
            }
          });
        }
      },
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  /// Returns the previous button.
  Widget _previousStep(StepEnabling enabling) {
    return IconButton(
      onPressed: () {
        if (activeStep2 > 0) {
          setState(() => enabling == StepEnabling.sequential
              ? --activeStep2
              : activeStep2 =
                  reachedSteps.lastWhere((element) => element < activeStep2));
        }
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}

enum StepEnabling { sequential, individual }
