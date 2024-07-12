import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled1/const/asset_const.dart';
import 'package:untitled1/const/color_const.dart';
import 'package:untitled1/customs/custom_row_column.dart';
import 'package:untitled1/customs/custom_text_field.dart';
import 'package:untitled1/customs/custom_text_form_field.dart';
import 'package:untitled1/view/dashboard/dashboard_screen.dart';

import '../../controller/contact_us_controller.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({super.key});

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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Get In ",
                          style: TextStyle(
                            fontWeight: FontTheme.notoSemiBold,
                            fontSize: !sizingInformation.isDesktop ? 32 : 36,
                          ),
                        ),
                        TextSpan(
                          text: "Touch",
                          style: TextStyle(
                            fontWeight: FontTheme.notoSemiBold,
                            color: ColorTheme.kGraphGreenColor,
                            fontSize: !sizingInformation.isDesktop ? 32 : 36,
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 56),
                  SvgPicture.asset(AssetsString.kUnderLineSvg).paddingSymmetric(horizontal: 56),
                  const SizedBox(height: 16),
                  const TextWidget(
                      text: 'Questions, bug reports, feedback - we’re here for it all', fontSize: 14),
                  const SizedBox(height: 30),
                  RowColumnWidget(
                    grouptype: !sizingInformation.isDesktop ? GroupType.column : GroupType.row,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (!sizingInformation.isDesktop)
                        HtmlWidget(
                          '''
 <iframe
              src="https://www.google.com/maps/d/embed?mid=1Gged7vUmjwz3LfGTjDCo-t32MjgyVIU"
              frameBorder="0"
              style={{ border: 0 }}
              allowFullScreen
              aria-hidden="false"
              className={styles.backgroundImage}
            ></iframe>
  ''',
                          customStylesBuilder: (element) {
                            if (element.classes.contains('foo')) {
                              return {'color': 'red'};
                            }

                            return null;
                          },
                        ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 10 : 50, vertical: 30),
                      expandedRow(
                        sizingInformation.isDesktop,
                        flex: sizingInformation.isDesktop ? 3 : 1,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              constraints: const BoxConstraints(maxWidth: 400),
                              child: CustomTextFormField(
                                hintText: 'Name*',
                                controller: controller.nameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 400),
                              child: CustomTextFormField(
                                hintText: 'Email*',
                                controller: controller.emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!GetUtils.isEmail(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 400),
                              child: CustomTextFormField(
                                hintText: 'Phone number*',
                                controller: controller.contactNoController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Phone number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 400),
                              child: CustomTextFormField(
                                hintText: 'How did you find us?',
                                controller: controller.howDidYouFindUsController,
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return 'Please enter How did you find us?';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                            const SizedBox(height: 24),
                            InkWell(
                              onTap: controller.submitForm,
                              child: Container(
                                width: Get.width,
                                constraints: const BoxConstraints(maxWidth: 400),
                                decoration: BoxDecoration(
                                    color: ColorTheme.kGraphGreenColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const TextWidget(
                                        text: "SEND",
                                        textAlign: TextAlign.center,
                                        color: ColorTheme.kWhite,
                                        fontSize: 16)
                                    .paddingSymmetric(vertical: 8),
                              ),
                            ),
                            Wrap(
                              children: [
                                ...List.generate(
                                  controller.contactUsList.length,
                                  (index) {
                                    return Wrap(
                                      children: [
                                        Icon(
                                          controller.contactUsList[index]['icon'],
                                          size: 28,
                                        ).paddingSymmetric(horizontal: 12),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                                text: controller.contactUsList[index]['title'], fontSize: 12),
                                            TextWidget(
                                              text: controller.contactUsList[index]['value'],
                                              color: ColorTheme.kGraphGreenColor,
                                              fontSize: 12,
                                            )
                                          ],
                                        ),
                                      ],
                                    ).paddingOnly(bottom: 8);
                                  },
                                )
                              ],
                            ).paddingSymmetric(vertical: 30)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      if (sizingInformation.isDesktop)
                        Expanded(
                          flex: 5,
                          child: HtmlWidget(
                            '''
 <iframe 
              src="https://www.google.com/maps/d/embed?mid=1Gged7vUmjwz3LfGTjDCo-t32MjgyVIU"
              frameBorder="0" 
              style={{ border: 0 }} 
              allowFullScreen 
              aria-hidden="false"
              className={styles.backgroundImage}
            ></iframe>
  ''',
                            customStylesBuilder: (element) {
                              if (element.classes.contains('foo')) {
                                return {'color': 'red'};
                              }

                              return null;
                            },
                          ),
                        )
                    ],
                  ).paddingSymmetric(horizontal: 56),
                  // if (!sizingInformation.isTablet)
                  //   RowColumnWidget(
                  //     grouptype: sizingInformation.isMobile ? GroupType.column : GroupType.row,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       ...List.generate(
                  //         controller.contactUsList.length,
                  //         (index) {
                  //           return IntrinsicHeight(
                  //             child: Wrap(
                  //               children: [
                  //                 Icon(
                  //                   controller.contactUsList[index]['icon'],
                  //                   size: 30,
                  //                 ).paddingOnly(left: 12),
                  //                 const VerticalDivider(),
                  //                 Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     TextWidget(
                  //                       text: controller.contactUsList[index]['title'],
                  //                       fontSize: 14,
                  //                     ),
                  //                     TextWidget(
                  //                       text: controller.contactUsList[index]['value'],
                  //                       color: ColorTheme.kGraphGreenColor,
                  //                       fontSize: 14,
                  //                     )
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ).paddingOnly(bottom: sizingInformation.isMobile ? 8 : 0);
                  //         },
                  //       )
                  //     ],
                  //   ).marginSymmetric(vertical: sizingInformation.isMobile ? 50 : 0),
                  const SizedBox(height: 26),
                  bottomBar(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
