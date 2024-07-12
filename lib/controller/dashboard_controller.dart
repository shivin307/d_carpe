import 'package:get/get.dart';

import '../const/asset_const.dart';

class DashboardController extends GetxController {
  final List<String> headers = ["Home", "Services", "About", "Contact", "Work With Us"];
  final RxInt headerIndex = 0.obs;
  List<Map<String, String>> mediaLink = [
    {
      'svg': AssetsString.kFacebookSvg,
      'link': 'kFacebookSvg',
    },
    {
      'svg': AssetsString.kInstagramSvg,
      'link': 'kInstagramSvg',
    },
    {
      'svg': AssetsString.kYoutubeSvg,
      'link': 'kYoutubeSvg',
    },
    {
      'svg': AssetsString.kLinkedInCircleSvg,
      'link': 'kLinkedInCircleSvg',
    },
    {
      'svg': AssetsString.kTwitterSvg,
      'link': 'kTwitterSvg',
    },
  ];
}
