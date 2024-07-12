import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled1/const/color_const.dart';
import 'package:untitled1/const/string_const.dart';
import 'package:untitled1/controller/dashboard_controller.dart';
import 'package:untitled1/controller/home_controller.dart';
import 'package:untitled1/controller/work_with_us_controller.dart';
import 'package:untitled1/customs/custom_row_column.dart';
import 'package:untitled1/customs/custom_text_field.dart';
import 'package:untitled1/customs/custom_text_form_field.dart';
import 'package:untitled1/helper/extension.dart';
import 'package:untitled1/view/dashboard/dashboard_screen.dart';

import '../../const/asset_const.dart';
import '../../customs/custom_slider.dart';
import '../../helper/regex.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 28),
                introWidget().paddingSymmetric(horizontal: 56),
                const SizedBox(height: 28),
                ourHappyClientsWidget(context).paddingSymmetric(horizontal: 56),
                const SizedBox(height: 28),
                contactWidget().paddingSymmetric(horizontal: 56),
                const SizedBox(height: 28),
                Container(
                  decoration: BoxDecoration(
                      color: ColorTheme.kOGBlueColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (!sizingInformation.isMobile && screenWidth >= 850)
                        Image.asset(AssetsString.kImage3, height: screenWidth * 0.4),
                      Column(
                        crossAxisAlignment:
                            (screenWidth < 850) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                        children: [
                          if (sizingInformation.isMobile)
                            Image.asset(AssetsString.kImage3, height: screenWidth * 0.4)
                                .paddingOnly(bottom: 20),
                          Row(
                            children: [
                              if (!sizingInformation.isMobile && screenWidth < 850 && screenWidth > 620) ...[
                                Image.asset(AssetsString.kImage3, height: screenWidth * 0.2)
                                    .paddingSymmetric(horizontal: 16)
                              ],
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Why choose ",
                                      style: TextStyle(
                                        fontWeight: FontTheme.notoSemiBold,
                                        fontSize: !sizingInformation.isDesktop ? 32 : 36,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Us",
                                      style: TextStyle(
                                        fontWeight: FontTheme.notoSemiBold,
                                        color: ColorTheme.kOGBlueColor,
                                        fontSize: !sizingInformation.isDesktop ? 32 : 36,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " for\n",
                                      style: TextStyle(
                                        fontWeight: FontTheme.notoSemiBold,
                                        color: ColorTheme.kBlack,
                                        fontSize: !sizingInformation.isDesktop ? 32 : 36,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Answer",
                                      style: TextStyle(
                                        fontWeight: FontTheme.notoSemiBold,
                                        color: ColorTheme.kOGBlueColor,
                                        fontSize: !sizingInformation.isDesktop ? 32 : 36,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Your ",
                                      style: TextStyle(
                                        fontWeight: FontTheme.notoSemiBold,
                                        color: ColorTheme.kBlack,
                                        fontSize: !sizingInformation.isDesktop ? 32 : 36,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Anesthetic\n",
                                      style: TextStyle(
                                        fontWeight: FontTheme.notoSemiBold,
                                        color: ColorTheme.kOGBlueColor,
                                        fontSize: !sizingInformation.isDesktop ? 32 : 36,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Treatments?",
                                      style: TextStyle(
                                        fontWeight: FontTheme.notoSemiBold,
                                        color: ColorTheme.kOGBlueColor,
                                        fontSize: !sizingInformation.isDesktop ? 32 : 36,
                                      ),
                                    ),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 8),
                            ],
                          ),
                          const SizedBox(height: 28),
                          const TextWidget(
                            text:
                                "We use only the best quality materials on the market\nin order to provide the best treatment to our patients.",
                            fontWeight: FontTheme.notoRegular,
                            color: ColorTheme.kHintTextColor,
                            fontSize: 14,
                          ),
                          const SizedBox(height: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              featureRow(text: "Top quality anesthesia team"),
                              featureRow(text: "State of the art anesthesia services"),
                              featureRow(text: "Discount on all anesthesia treatment"),
                              featureRow(text: "Enrollment is quick and easy"),
                            ],
                          ),
                        ],
                      )
                    ],
                  ).paddingSymmetric(vertical: 24),
                ).paddingSymmetric(horizontal: 56),
                const SizedBox(height: 28),
                bottomBar()
              ],
            ),
          );
        },
      ),
    );
  }

  Widget ourHappyClientsWidget(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Column(
          children: [
            TextWidget(
              text: "Our Happy Clients",
              fontWeight: FontTheme.notoSemiBold,
              color: ColorTheme.kBlack,
              fontSize: !sizingInformation.isDesktop ? 32 : 36,
            ),
            SvgPicture.asset(AssetsString.kUnderLineSvg),
            const SizedBox(height: 16),
            const TextWidget(
              text:
                  "We use only the best quality materials on the market\nin order to provide the best treatment to our patients.",
              fontWeight: FontTheme.notoRegular,
              color: ColorTheme.kHintTextColor,
              textAlign: TextAlign.center,
              fontSize: 14,
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                CustomSlider(
                    height: sizingInformation.isDesktop
                        ? 500
                        : sizingInformation.isTablet
                            ? 475
                            : 675,
                    images: controller.hospitalCardList.map((item) {
                      return buildCard(
                        logo: item['logo']!,
                        image: item['image']!,
                        text: item['text']!,
                      ).marginSymmetric(
                          horizontal: !sizingInformation.isDesktop
                              ? sizingInformation.isMobile
                                  ? 12
                                  : 24
                              : 0);
                    }).toList()),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget buildCard({required String logo, required String image, required String text}) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        return Center(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: sizingInformation.isDesktop ? 80 : 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      ColorTheme.kOGBlueColor.withOpacity(0.9),
                      ColorTheme.kOGBlueColor.withOpacity(0.7),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: RowColumnWidget(
                  grouptype: !sizingInformation.isDesktop ? GroupType.column : GroupType.row,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: sizingInformation.isTablet
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.center,
                      children: [
                        Image.asset(image, height: sizingInformation.isMobile ? 200 : screenWidth * 0.3)
                            .paddingOnly(top: !sizingInformation.isDesktop ? 30 : 0),
                        if (sizingInformation.isTablet) SvgPicture.asset(logo, height: 70)
                      ],
                    ),
                    if (!sizingInformation.isDesktop) const SizedBox(height: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!sizingInformation.isTablet)
                            SvgPicture.asset(logo, height: 90).paddingOnly(bottom: 50),
                          expandedColumn(
                            !sizingInformation.isDesktop,
                            TextWidget(
                              text: text,
                              fontWeight: FontTheme.notoRegular,
                              color: ColorTheme.kWhite,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 12),
                    )
                  ],
                ).paddingSymmetric(horizontal: 10),
              ),
              if (sizingInformation.isDesktop) ...[
                Positioned(left: 55, bottom: 10, child: SvgPicture.asset(AssetsString.kDotDesign1)),
                Positioned(right: 50, top: -50, child: SvgPicture.asset(AssetsString.kDotDesign2)),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget featureRow({required String text}) {
    return Row(
      children: [
        SvgPicture.asset(AssetsString.kShieldSvg),
        const SizedBox(width: 8),
        TextWidget(
          text: text,
          fontSize: 16,
        )
      ],
    ).marginSymmetric(vertical: 4);
  }

  Widget introWidget() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;

        double svgHeight = screenWidth * 0.4;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment:
                    !sizingInformation.isDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: StringConst.kExcellenceInAnesthesiaStaffing,
                              fontWeight: FontTheme.notoBlack,
                              fontSize: sizingInformation.isMobile ? 32 : 36),
                          SvgPicture.asset(AssetsString.kUnderLineSvg),
                        ],
                      ),
                      if (!sizingInformation.isMobile &&
                          sizingInformation.screenSize.width < 860 &&
                          sizingInformation.screenSize.width > 650) ...[
                        const Spacer(),
                        SvgPicture.asset(AssetsString.kHomeDocImageSvg, height: svgHeight / 2)
                      ],
                    ],
                  ),
                  SizedBox(height: sizingInformation.isMobile ? 24 : 50),
                  TextWidget(
                    text: StringConst.kProvidingTopTier,
                    fontWeight: FontTheme.notoRegular,
                    color: ColorTheme.kHintTextColor,
                    textAlign: sizingInformation.isMobile ? TextAlign.center : null,
                    fontSize: 14,
                  ),
                  SizedBox(height: sizingInformation.isMobile ? 24 : 36),
                  Card(
                    color: ColorTheme.kWhite,
                    shadowColor: ColorTheme.kBlack.withOpacity(0.3),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AssetsString.kNYULogoPurpleSvg,
                          height: 40,
                        ).paddingOnly(bottom: 16, top: 4),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: StringConst.kNYULangoneHealth,
                                style: TextStyle(
                                  fontWeight: FontTheme.notoRegular,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: StringConst.kNYUIsRated,
                                style: TextStyle(
                                  fontWeight: FontTheme.notoSemiBold,
                                  color: ColorTheme.kTextBlueColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).marginAll(12),
                  ),
                ],
              ),
            ),
            if (!sizingInformation.isMobile && sizingInformation.screenSize.width >= 860)
              SvgPicture.asset(AssetsString.kHomeDocImageSvg, height: svgHeight),
          ],
        );
      },
    );
  }

  Widget treatmentInfoWidget({
    required String iconSVG,
    required String titleText,
    required String paragraphText,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorTheme.kWhite,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: ColorTheme.kLightBlueColor,
              child: SvgPicture.asset(
                iconSVG,
                height: 30,
              ),
            ),
            const SizedBox(height: 12),
            TextWidget(
              text: titleText,
              fontWeight: FontTheme.notoBold,
              color: ColorTheme.kBlack,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextWidget(
              text: paragraphText,
              fontWeight: FontTheme.notoRegular,
              color: ColorTheme.kBlack,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    text: StringConst.kLearnMore,
                    fontWeight: FontTheme.notoRegular,
                    color: ColorTheme.kBlack,
                    textDecoration: TextDecoration.underline,
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    AssetsString.kCircleRightArrowSvg,
                    height: 14,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contactWidget() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return RowColumnWidget(
          grouptype: sizingInformation.isDesktop ? GroupType.row : GroupType.column,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!sizingInformation.isDesktop) ...[
              Stack(
                children: [
                  const SizedBox(height: 400, width: 400),
                  Positioned(
                    left: 55,
                    child: Container(
                      height: 365,
                      width: 325,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        gradient: LinearGradient(
                          colors: [
                            ColorTheme.kOGBlueColor.withOpacity(0.4),
                            ColorTheme.kWhite,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                    ),
                  ),
                  Positioned(top: 30, right: 50, child: Image.asset(AssetsString.kImage2)),
                ],
              ),
              const SizedBox(height: 12)
            ],
            expandedRow(
              sizingInformation.isDesktop,
              Column(
                crossAxisAlignment:
                    !sizingInformation.isDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "We’re ",
                          style: TextStyle(
                            fontWeight: FontTheme.notoBlack,
                            fontSize: !sizingInformation.isDesktop ? 32 : 36,
                          ),
                        ),
                        TextSpan(
                          text: "Welcoming",
                          style: TextStyle(
                            fontWeight: FontTheme.notoBlack,
                            color: ColorTheme.kOGBlueColor,
                            fontSize: !sizingInformation.isDesktop ? 32 : 36,
                          ),
                        ),
                        // WidgetSpan(
                        //   child: Column(
                        //     children: [
                        //       Text(
                        //         "Welcoming",
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 36,
                        //           color: Colors.blue,
                        //         ),
                        //       ),
                        //       SvgPicture.asset(
                        //         AssetsString.kUnderLineSvg,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        TextSpan(
                          text: " new\npatients and can’t wait\nto meet you.",
                          style: TextStyle(
                            fontWeight: FontTheme.notoBlack,
                            color: ColorTheme.kBlack,
                            fontSize: !sizingInformation.isDesktop ? 32 : 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  const TextWidget(
                    text:
                        "We use only the best quality materials on the market\nin order to provide the best products to our patients,\nSo don’t worry about anything and book yourself.",
                    fontWeight: FontTheme.notoRegular,
                    color: ColorTheme.kHintTextColor,
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 450,
                    child: Form(
                      key: controller.formKey,
                      child: CustomTextFormField(
                        controller: Get.find<WorkWithUsController>().emailController,
                        labelText: 'Enter your Email',
                        borderRadius: 12,
                        fontWeight: FontTheme.notoRegular,
                        borderColor: ColorTheme.kHintTextColor,
                        inputFormatters: [inputTextEmailFormatter],
                        fontSize: 16,
                        validator: (v) {
                          if (v.toString().isNullOrEmpty) {
                            return 'Mail field cannot be empty';
                          }
                          return null;
                        },
                        suffixWidget: InkWell(
                          onTap: () {
                            if (controller.formKey.currentState?.validate() ?? false) {
                              Get.find<DashboardController>().headerIndex.value = 4;
                            } else {
                              Get.snackbar(
                                'Validation Error',
                                'Please fill in the required field',
                                snackPosition: SnackPosition.TOP,
                                maxWidth: 500,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorTheme.kOGBlueColor,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: const Center(
                              child: TextWidget(
                                  text: 'Submit',
                                  color: ColorTheme.kWhite,
                                  fontWeight: FontTheme.notoRegular),
                            ),
                          ),
                        ),
                        showSuffixDivider: false,
                        prefixWidget: const Icon(
                          Icons.mail_outline_rounded,
                          color: ColorTheme.kHintTextColor,
                        ).paddingSymmetric(horizontal: 8),
                        showPrefixDivider: false,
                      ),
                    ),
                  )
                ],
              ).paddingOnly(left: sizingInformation.isDesktop ? 60 : 0),
            ),
            if (sizingInformation.isDesktop)
              Stack(
                children: [
                  const SizedBox(height: 400, width: 400),
                  Positioned(
                    left: 55,
                    child: Container(
                      height: 365,
                      width: 325,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        gradient: LinearGradient(
                          colors: [
                            ColorTheme.kOGBlueColor.withOpacity(0.4),
                            ColorTheme.kWhite,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                    ),
                  ),
                  Positioned(top: 30, right: 50, child: Image.asset(AssetsString.kImage2)),
                ],
              ),
          ],
        );
      },
    );
  }
}
