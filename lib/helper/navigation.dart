import 'package:flutter/material.dart';
import 'package:get/get.dart';

navigateTo(String name) {
  clearFocus();
  Get.rootDelegate.offAndToNamed(name);
}

void navigateOff(Widget page) {
  Get.off(() => page);
}

void navigateOffAll(Widget page) {
  Get.offAll(() => page);
}

getCurrentPageName() {
  try {
    return Get.rootDelegate.history.last.locationString.split("/").last;
  } catch (e) {
    return 'login';
  }
}

clearFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}
