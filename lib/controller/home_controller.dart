import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/asset_const.dart';

class HomeController extends GetxController {
  var formKey = GlobalKey<FormState>();
  RxString contactNo = ''.obs;

  List<Map<String, String>> hospitalCardList = [
    {
      'logo': AssetsString.kNYULogoWhiteSvg,
      'image': AssetsString.kHospital1,
      'text':
          '''“ NYU Langone Health, ranked #1 in NY for quality and patient safety, has 10 specialties in the national top 10. It includes over 320 locations, six inpatient facilities, and the NYU Grossman School of Medicine. Visit nyulangone.org for more. ”''',
    },
    {
      'logo': AssetsString.kNorthWellLogoSvg,
      'image': AssetsString.kHospital2,
      'text':
          '''" Northwell Health, New York State’s largest healthcare provider and private employer, includes 21 hospitals, 900 outpatient facilities, and 12,000+ affiliated physicians. It leads in medical breakthroughs at the Feinstein Institutes and trains future professionals at the Zucker School of Medicine and Hofstra Northwell School of Nursing and Physician Assistant Studies. "''',
    },
  ];
}
