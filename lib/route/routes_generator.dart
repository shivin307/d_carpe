import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:untitled1/view/dashboard/dashboard_screen.dart';

import '../global_screen_binding.dart';

class RouteNames {
  static const String kDashboard = "/dashboard";
}

class RouteGenerator {
  static List<GetPage<dynamic>> generate() {
    Transition navigationTransaction = Transition.fadeIn;
    return <GetPage<dynamic>>[
      GetPage(
        name: RouteNames.kDashboard,
        page: () => const DashboardScreen(),
        binding: GlobalScreenBindings(),
        // middlewares: [NavigatorMiddleware()],
        transition: navigationTransaction,
      ),
    ];
  }
}
