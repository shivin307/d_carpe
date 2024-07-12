import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled1/const/color_const.dart';
import 'package:untitled1/customs/custom_row_column.dart';
import 'package:untitled1/customs/custom_text_field.dart';
import 'package:untitled1/view/dashboard/dashboard_screen.dart';

import '../../const/asset_const.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
                const SizedBox(height: 24),
                TextWidget(
                  text: "About Us",
                  fontWeight: FontTheme.notoBold,
                  color: ColorTheme.kBlack,
                  fontSize: !sizingInformation.isDesktop ? 32 : 36,
                ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
                SvgPicture.asset(AssetsString.kUnderLineSvg)
                    .paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
                const SizedBox(height: 24),
                RowColumnWidget(
                  grouptype: sizingInformation.isMobile ? GroupType.column : GroupType.row,
                  children: [
                    expandedRow(
                      !sizingInformation.isMobile,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Our Mission",
                            fontWeight: FontTheme.notoSemiBold,
                            color: ColorTheme.kBlack,
                            fontSize: !sizingInformation.isDesktop ? 30 : 32,
                          ),
                          if (sizingInformation.isMobile)
                            Image.asset(
                              AssetsString.kAboutUs1,
                              height: 250,
                            ).paddingSymmetric(vertical: 12),
                          const TextWidget(
                            text:
                                '''" To connect healthcare facilities with top-tier anesthesia professionals through innovative solutions, exceptional service, and unwavering dedication to patient care. We aim to provide seamless staffing experiences, ensuring reliable and qualified anesthesia coverage that meets the diverse needs of our clients. With a commitment to professionalism, efficiency, and continuous improvement, we strive to enhance healthcare outcomes and patient safety across every engagement. "''',
                            color: ColorTheme.kHintTextColor,
                          ).paddingSymmetric(vertical: 8),
                          TextWidget(
                            text:
                                "Our Utmost Priority Is Ensuring Patient Comfort And Well-Being During Anesthesia Procedures.",
                            fontSize: !sizingInformation.isDesktop ? 16 : 20,
                          ),
                          const TextWidget(
                            text:
                                "Our mission is to provide outstanding anesthesia services by leveraging the expertise of our highly skilled providers and the latest advancements in medical technology. We are dedicated to ensuring patient safety, comfort, and achieving optimal outcomes through personalized care plans tailored to each individual's needs. By fostering a culture of teamwork and leadership, we continuously improve and collaborate closely with healthcare teams to enhance the overall surgical experience. Prioritizing innovation, education, and excellence, we strive to set the standard for anesthesia staffing and contribute meaningfully to the advancement of healthcare.",
                            color: ColorTheme.kHintTextColor,
                          ).paddingSymmetric(vertical: 16),
                        ],
                      ).paddingOnly(left: sizingInformation.isMobile ? 0 : 20),
                    ),
                    if (!sizingInformation.isMobile) ...[
                      const SizedBox(width: 20),
                      expandedRow(
                          !sizingInformation.isMobile,
                          Image.asset(
                            AssetsString.kAboutUs1,
                            height: 400,
                            alignment: Alignment.center,
                          ).paddingSymmetric(vertical: 20))
                    ]
                  ],
                ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
                const SizedBox(height: 16),
                RowColumnWidget(
                  grouptype: sizingInformation.isMobile ? GroupType.column : GroupType.row,
                  children: [
                    if (!sizingInformation.isMobile)
                      expandedRow(
                          !sizingInformation.isMobile,
                          Image.asset(
                            AssetsString.kAboutUs2,
                            height: 400,
                            alignment: Alignment.center,
                          ).paddingAll(20)),
                    expandedRow(
                      !sizingInformation.isMobile,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Our Vision",
                            fontWeight: FontTheme.notoSemiBold,
                            color: ColorTheme.kBlack,
                            fontSize: !sizingInformation.isDesktop ? 30 : 32,
                          ),
                          if (sizingInformation.isMobile)
                            Image.asset(AssetsString.kAboutUs2, height: 250).paddingSymmetric(vertical: 12),
                          const TextWidget(
                            text:
                                "Our mission is to be the foremost anesthesia staffing solution, celebrated for our outstanding performance, dependability, and innovative approach in healthcare staffing. We are dedicated to creating a future where every healthcare facility can effortlessly access the finest anesthesia professionals, thereby guaranteeing the highest level of patient care and safety. Our unwavering commitment to quality is at the heart of everything we do. We employ advanced technology to streamline our processes, ensuring that we not only meet but exceed industry standards. By continuously supporting our clients and professionals, we strive to deliver exceptional service that sets us apart in the competitive healthcare staffing landscape.",
                            color: ColorTheme.kHintTextColor,
                          ).paddingOnly(top: 8),
                          const TextWidget(
                            text:
                                "Looking ahead, we envision building a robust network of trusted partnerships that contribute significantly to the overall enhancement of healthcare delivery. Our goal is to pioneer new standards in the industry through our dedication to quality, cutting-edge technology, and unwavering support. We believe that by fostering a collaborative environment, we can drive innovation and efficiency, ultimately improving patient outcomes and the healthcare experience as a whole. Our mission is not just about staffing; it's about making a meaningful impact on healthcare by ensuring that every patient receives the best possible care through the expertise of top anesthesia professionals.",
                            color: ColorTheme.kHintTextColor,
                          ).paddingSymmetric(vertical: 16),
                        ],
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: sizingInformation.isMobile ? 40 : 56),
                bottomBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}
