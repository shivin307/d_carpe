import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomToast(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black.withOpacity(0.8),
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ),
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showError(String message) {
  showCustomToast(Get.context!, message);
}

void showSuccess(String message) {
  showCustomToast(Get.context!, message);
}
