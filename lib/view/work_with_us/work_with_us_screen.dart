import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled1/const/color_const.dart';
import 'package:untitled1/controller/work_with_us_controller.dart';
import 'package:untitled1/customs/custom_text_field.dart';
import 'package:untitled1/helper/extension.dart';
import 'package:untitled1/view/dashboard/dashboard_screen.dart';

import '../../const/asset_const.dart';
import '../../customs/custom_text_form_field.dart';

class WorkWithUsScreen extends GetView<WorkWithUsController> {
  const WorkWithUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  TextWidget(
                    text: "Work With Us",
                    fontWeight: FontTheme.notoBold,
                    color: ColorTheme.kBlack,
                    fontSize: !sizingInformation.isDesktop ? 32 : 36,
                  ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
                  SvgPicture.asset(AssetsString.kUnderLineSvg)
                      .paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
                  const SizedBox(height: 16),
                  const TextWidget(
                      text: 'Questions, bug reports, feedback - we’re here foe it all', fontSize: 14),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.emailController.text.isNullOrEmpty) ...[
                        _buildQuestionLabel("Email"),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: sizingInformation.isDesktop ? Get.width / 3 : null,
                          child: CustomTextFormField(
                            controller: controller.emailController,
                            // labelText: "Credentialing Time Explanation",
                            fontSize: 16,
                            borderRadius: 8,
                            height: 18,
                          ),
                        ),
                        const SizedBox(height: 16)
                      ],
                      _buildQuestionLabel("Have they worked at NYU or Northwell before?"),
                      _buildYesNoCheckbox(),
                      const SizedBox(height: 16),
                      _buildQuestionLabel(
                          "What is their expected commitment? I.e. how many days per week? The work is Monday-Friday primarily, some weekend opportunities may be available in the future."),
                      _buildCustomDropdown(controller.expectedCommitment, 1, 5),
                      const SizedBox(height: 16),
                      _buildQuestionLabel(
                          "How many years experience do they have as an anesthesiologist and how many years experience doing locums work."),
                      _buildCustomDropdown(controller.yearsExperience, 1, 5),
                      const SizedBox(height: 16),
                      _buildQuestionLabel(
                          "Explain that they need to purchase their own malpractice insurance & excess insurance (limits required 1.3/3.9M, excess 1/3m) We have an insurance broker that can help him if needed."),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: sizingInformation.isDesktop ? Get.width / 3 : null,
                        child: CustomTextFormField(
                          controller: controller.malpracticeInsuranceExplanationController,
                          // labelText: "Malpractice Insurance Explanation",
                          fontSize: 16,
                          borderRadius: 8,
                          height: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildQuestionLabel(
                          "It takes 3 months to credential and we make our schedule 2 months in advance."),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: sizingInformation.isDesktop ? Get.width / 3 : null,
                        child: CustomTextFormField(
                          controller: controller.credentialingTimeController,
                          // labelText: "Credentialing Time Explanation",
                          fontSize: 16,
                          borderRadius: 8,
                          height: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildQuestionLabel(
                          "Is he interested in ambulatory anesthesia or only hospital anesthesia"),
                      _buildAmbulatoryCheckbox(),
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.submit();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorTheme.kDarkBlueColor, borderRadius: BorderRadius.circular(8)),
                          child: const TextWidget(text: "Apply", color: ColorTheme.kWhite, fontSize: 16)
                              .paddingSymmetric(vertical: 8, horizontal: 100),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
                  const SizedBox(height: 24),
                  bottomBar(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuestionLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextWidget(
        text: text,
        color: ColorTheme.kBlack,
        fontWeight: FontTheme.notoMedium,
        fontSize: 16,
      ),
    );
  }

  Widget _buildYesNoCheckbox() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildCheckbox("Yes", controller.workedAtNYUOrNorthwell.value == true, () {
                controller.workedAtNYUOrNorthwell.value = true;
              }),
              const SizedBox(width: 16),
              _buildCheckbox("No", controller.workedAtNYUOrNorthwell.value == false, () {
                controller.workedAtNYUOrNorthwell.value = false;
              }),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildCheckbox(String text, bool value, VoidCallback onChanged) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (_) => onChanged(),
            activeColor: ColorTheme.kDarkBlueColor,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildCustomDropdown(RxInt selectedValue, int minValue, int maxValue) {
    return Obx(() {
      return Theme(
        data: Theme.of(Get.context!).copyWith(
          hoverColor: ColorTheme.kBlue,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: PopupMenuButton(
          offset: const Offset(0, 35),
          constraints: const BoxConstraints(
            minWidth: 100,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          tooltip: '',
          surfaceTintColor: ColorTheme.kWhite,
          shadowColor: ColorTheme.kBlack,
          elevation: 6,
          popUpAnimationStyle: AnimationStyle(
            curve: Curves.bounceInOut,
          ),
          onSelected: (value) {
            selectedValue.value = value;
          },
          position: PopupMenuPosition.over,
          padding: EdgeInsets.zero,
          color: ColorTheme.kWhite,
          itemBuilder: (context) {
            return List.generate(maxValue - minValue + 1, (index) => minValue + index)
                .map((value) => PopupMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    ))
                .toList();
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorTheme.kWhite /*ColorTheme.kLightBlueColor.withOpacity(0.2)*/),
            child: Row(
              children: [
                Text(
                  selectedValue.value.toString(),
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: ColorTheme.kBlack),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: ColorTheme.kBlack,
                ),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 4),
          ),
        ),
      ).paddingOnly(top: 4);
    });
  }

  Widget _buildAmbulatoryCheckbox() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCheckbox("Ambulatory anesthesia", controller.interestedInAmbulatory.value, () {
            controller.toggleInterest("Ambulatory");
          }),
          _buildCheckbox("Hospital anesthesia", controller.interestedInHospital.value, () {
            controller.toggleInterest("Hospital");
          }),
          _buildCheckbox("None", controller.interestedInNone.value, () {
            controller.toggleInterest("None");
          }),
        ],
      );
    });
  }
}
