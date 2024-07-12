import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController howDidYouFindUsController = TextEditingController();

  void submitForm() {
    if (formKey.currentState!.validate()) {}
  }

  List<Map<String, dynamic>> contactUsList = [
    {
      'icon': Icons.wifi_calling_3_outlined,
      'title': 'NAME',
      'value': '03 5432 1234',
    },
    {
      'icon': Icons.email_outlined,
      'title': 'EMAIL',
      'value': 'info@marcc.com.au',
    },
    {
      'icon': Icons.place_outlined,
      'title': 'LOCATION',
      'value': '8105 SW 16 PL, GAINESVILLE, FL, 32607',
    },
  ];
}
