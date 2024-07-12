import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled1/controller/service_controller.dart';
import 'package:untitled1/customs/frosted_glass.dart';
import 'package:untitled1/view/dashboard/dashboard_screen.dart';

import '../../const/asset_const.dart';
import '../../const/color_const.dart';
import '../../customs/custom_hover_effect.dart';
import '../../customs/custom_text_field.dart';

class ServiceScreen extends GetView<ServiceController> {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                serviceRow().paddingSymmetric(horizontal: 28, vertical: 50),
                const SizedBox(height: 100),
                doctorRow().paddingSymmetric(horizontal: 28, vertical: 50),
                // Container(
                //   decoration: BoxDecoration(color: ColorTheme.kBlue, borderRadius: BorderRadius.circular(8)),
                //   child: Row(
                //     children: [
                //       treatmentInfoWidget(
                //           iconSVG: AssetsString.kTeethSvg,
                //           titleText: StringConst.kRootCanalTreatment,
                //           paragraphText: StringConst.kRootCanalTreatmentEndodontics),
                //       treatmentInfoWidget(
                //           iconSVG: AssetsString.kSmileSvg,
                //           titleText: StringConst.kCosmeticDentist,
                //           paragraphText: StringConst.kCosmeticDentistryIs),
                //       treatmentInfoWidget(
                //           iconSVG: AssetsString.kImplantSvg,
                //           titleText: StringConst.kDentalImplants,
                //           paragraphText: StringConst.kADentalImplant),
                //     ],
                //   ),
                // ).paddingSymmetric(horizontal: 56),
                bottomBar()
              ],
            ),
          );
        },
      ),
    );
  }

  Widget serviceRow() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Column(
          children: [
            const TextWidget(
              text: "Services",
              color: ColorTheme.kBlack,
              fontWeight: FontTheme.notoSemiBold,
              fontSize: 32,
            ),
            SvgPicture.asset(AssetsString.kUnderLineSvg),
            const SizedBox(height: 36),
            const TextWidget(
              text:
                  "We provide only the best services beyond your expectation in order to provide the best results to our patients.",
              fontWeight: FontTheme.notoRegular,
              color: ColorTheme.kHintTextColor,
              textAlign: TextAlign.center,
              fontSize: 14,
            ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
            const SizedBox(height: 28),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    controller.serviceList.length,
                    (index) {
                      return Card(
                        elevation: 4,
                        color: ColorTheme.kScaffoldColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Column(
                          children: [
                            CustomHoverEffect(
                                imageUrl: controller.serviceList[index]['photo'] ?? '', width: 275),
                            const SizedBox(height: 24),
                            TextWidget(
                              text: controller.serviceList[index]['title'],
                              fontSize: 16,
                              fontWeight: FontTheme.notoSemiBold,
                            ).marginSymmetric(vertical: 8),
                            TextWidget(text: controller.serviceList[index]['subtitle'])
                                .marginOnly(bottom: 24),
                          ],
                        ),
                      ).paddingOnly(right: index + 1 < controller.serviceList.length ? 10 : 0);
                    },
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget doctorRow() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Column(
          children: [
            const TextWidget(
              text: "Meet Our Specialists",
              color: ColorTheme.kBlack,
              fontWeight: FontTheme.notoSemiBold,
              fontSize: 32,
            ),
            const SizedBox(height: 14),
            const TextWidget(
              text:
                  "We use only the best quality materials on the market in order to provide the best products to our patients.",
              fontWeight: FontTheme.notoRegular,
              color: ColorTheme.kHintTextColor,
              textAlign: TextAlign.center,
              fontSize: 14,
            ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
            const SizedBox(height: 28),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    controller.doctorList.length,
                    (index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 275,
                            clipBehavior: Clip.hardEdge,
                            decoration: ShapeDecoration(
                                color: ColorTheme.kRedError,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            child: Image.asset(controller.doctorList[index]['photo'] ?? ''),
                          ).paddingSymmetric(horizontal: 8),
                          // Positioned(
                          //   top: 6,
                          //   right: 0,
                          //   child: InkResponse(
                          //     onTap: () {
                          //       Get.snackbar('LinkedIn', 'Entered link for ${doctorList[index]['name'] ?? ''}',
                          //           snackPosition: SnackPosition.TOP, maxWidth: 500);
                          //     },
                          //     child: SvgPicture.asset(AssetsString.kLinkedInSquareSvg, height: 45),
                          //   ),
                          // ),
                          Positioned(
                            bottom: 8,
                            child: FrostedGlass(
                              child: Container(
                                width: 250,
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    end: const Alignment(0.99, -0.11),
                                    begin: const Alignment(-0.99, 0.11),
                                    colors: [
                                      ColorTheme.kOGBlueColor.withOpacity(0.6),
                                      ColorTheme.kOGBlueColor.withOpacity(0.3),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: controller.doctorList[index]['name'] ?? '',
                                      fontWeight: FontTheme.notoSemiBold,
                                      color: ColorTheme.kWhite,
                                      fontSize: 16,
                                    ),
                                    TextWidget(
                                      text: controller.doctorList[index]['role'] ?? '',
                                      fontWeight: FontTheme.notoRegular,
                                      color: ColorTheme.kWhite,
                                    ),
                                  ],
                                ).paddingSymmetric(vertical: 8),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
