import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled1/route/routes_generator.dart';
import 'package:untitled1/view/dashboard/dashboard_screen.dart';

import 'global_screen_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GlobalScreenBindings(),
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: RouteGenerator.generate(),
    );
  }
}
