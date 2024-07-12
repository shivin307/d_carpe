import 'package:get/get.dart';

import 'controller/contact_us_controller.dart';
import 'controller/dashboard_controller.dart';
import 'controller/home_controller.dart';
import 'controller/service_controller.dart';
import 'controller/work_with_us_controller.dart';

class GlobalScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<WorkWithUsController>(() => WorkWithUsController());
    Get.lazyPut<ContactUsController>(() => ContactUsController());
    Get.lazyPut<ServiceController>(() => ServiceController());
  }
}
