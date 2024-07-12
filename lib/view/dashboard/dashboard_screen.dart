import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled1/controller/dashboard_controller.dart';
import 'package:untitled1/customs/custom_text_field.dart';
import 'package:untitled1/view/contact_us/contact_us_screen.dart';
import 'package:untitled1/view/home/home_screen.dart';
import 'package:untitled1/view/service/service_screen.dart';
import 'package:untitled1/view/work_with_us/work_with_us_screen.dart';

import '../../const/asset_const.dart';
import '../../const/color_const.dart';
import '../about_us/about_us_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.only(top: 12),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorTheme.kBlue,
              ColorTheme.kScaffoldColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorTheme.kWhite,
                    boxShadow: kElevationToShadow[1],
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsString.kCarpeSpiritusLogoSvg,
                        height: 45,
                      ),
                      const Spacer(),
                      ...List.generate(controller.headers.length, (index) {
                        return Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.headerIndex.value = index;
                            },
                            child: Obx(() {
                              return TextWidget(
                                text: controller.headers[index],
                                color: ColorTheme.kBlack,
                                fontSize: !sizingInformation.isDesktop
                                    ? sizingInformation.isTablet
                                        ? 14
                                        : 12
                                    : 16,
                                textAlign: TextAlign.center,
                                fontWeight: index != controller.headerIndex.value
                                    ? FontTheme.notoRegular
                                    : FontTheme.notoSemiBold,
                              );
                            }),
                          ),
                        );
                      }),
                    ],
                  ).paddingSymmetric(vertical: 8, horizontal: sizingInformation.isMobile ? 16 : 30),
                ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 16 : 32),
                const SizedBox(height: 4),
                Expanded(
                  child: Obx(() {
                    return Center(
                      child: getPageContent(controller.headerIndex.value),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget getPageContent(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ServiceScreen();
      case 2:
        return const AboutUsScreen();
      case 3:
        return const ContactUsScreen();
      case 4:
        return const WorkWithUsScreen();
      default:
        return const TextWidget(
          text: 'Unknown',
          color: ColorTheme.kBlack,
          fontSize: 24,
          fontWeight: FontTheme.notoBold,
        );
    }
  }
}

Widget bottomBar() {
  DashboardController controller = Get.put(DashboardController());
  return ResponsiveBuilder(
    builder: (context, sizingInformation) {
      return Container(
        color: ColorTheme.kWhite,
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.headerIndex.value = 0;
                  },
                  child: SvgPicture.asset(
                    AssetsString.kCarpeSpiritusLogoSvg,
                    height: !sizingInformation.isDesktop ? 50 : 60,
                  ),
                ),
                const Spacer(),
                ...List.generate(controller.headers.length, (index) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.headerIndex.value = index;
                      },
                      child: Obx(() {
                        return TextWidget(
                          text: controller.headers[index],
                          color: ColorTheme.kBlack,
                          fontSize: !sizingInformation.isDesktop
                              ? sizingInformation.isTablet
                                  ? 14
                                  : 12
                              : 16,
                          textAlign: TextAlign.center,
                          fontWeight: index != controller.headerIndex.value
                              ? FontTheme.notoRegular
                              : FontTheme.notoSemiBold,
                        );
                      }),
                    ),
                  );
                }),
              ],
            ).paddingSymmetric(
                vertical: 8,
                horizontal: !sizingInformation.isDesktop
                    ? sizingInformation.isMobile
                        ? 30
                        : 70
                    : 90),
            const Divider(
              endIndent: 16,
              indent: 16,
              thickness: 1.5,
              height: 1,
              color: ColorTheme.kBlack,
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  ListView.separated(
                    itemCount: controller.mediaLink.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkResponse(
                        onTap: () {
                          Get.snackbar(
                              'Link', 'Entered link for ${controller.mediaLink[index]['link'] ?? ''}',
                              snackPosition: SnackPosition.TOP, maxWidth: 500);
                        },
                        child: SvgPicture.asset(controller.mediaLink[index]['svg'] ?? '',
                            height: !sizingInformation.isDesktop ? 20 : null),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextWidget(
                      text: 'All rights reserved ® Carpe Spiritus | Terms and conditions apply!',
                      textAlign: TextAlign.center,
                      fontSize: !sizingInformation.isDesktop ? 12 : null,
                    ),
                  )
                ],
              ),
            ).paddingSymmetric(horizontal: 30)
          ],
        ),
      );
    },
  );
}
