import 'package:get/get.dart';

import '../const/asset_const.dart';

class ServiceController extends GetxController {
  final List<Map<String, String>> doctorList = [
    {
      'photo': AssetsString.kDoctor1,
      'name': 'Jim Carry',
      'role': 'Orthodontist.',
      'linkedIn': '',
    },
    {
      'photo': AssetsString.kDoctor2,
      'name': 'Wade Warren',
      'role': 'Endodontist.',
      'linkedIn': '',
    },
    {
      'photo': AssetsString.kDoctor3,
      'name': 'Jenny Wilson',
      'role': 'Periodontist.',
      'linkedIn': '',
    },
    {
      'photo': AssetsString.kDoctor4,
      'name': 'Jacob Jones',
      'role': 'Pediatric Dentist.',
      'linkedIn': '',
    },
  ];

  final List<Map<String, String>> serviceList = [
    {
      'photo': AssetsString.kService1,
      'title': 'Elite Anesthesia Care',
      'subtitle': 'Trusted Surgical Care Team',
    },
    {
      'photo': AssetsString.kService2,
      'title': 'Cutting-Edge Technologies',
      'subtitle': 'Secure and Effective Care',
    },
    {
      'photo': AssetsString.kService3,
      'title': 'Collaboration and Leadership',
      'subtitle': 'Ongoing Enhancement',
    },
    {
      'photo': AssetsString.kService4,
      'title': 'Customized Care',
      'subtitle': 'Superior Outcomes',
    },
  ];
}
