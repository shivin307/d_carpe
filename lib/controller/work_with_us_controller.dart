import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkWithUsController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final workedAtNYUOrNorthwell = false.obs;
  final expectedCommitment = 1.obs;
  final yearsExperience = 1.obs;
  final malpracticeInsuranceExplanationController = TextEditingController();
  final credentialingTimeController = TextEditingController();
  final emailController = TextEditingController();
  final interestedInAmbulatory = false.obs;
  final interestedInHospital = false.obs;
  final interestedInNone = false.obs;

  bool validateSelections() {
    return interestedInAmbulatory.value || interestedInHospital.value || interestedInNone.value;
  }

  void toggleInterest(String interest) {
    if (interest == "None") {
      if (!interestedInNone.value) {
        interestedInNone.value = true;
        interestedInAmbulatory.value = false;
        interestedInHospital.value = false;
      } else {
        interestedInNone.value = false;
      }
    } else {
      if (interest == "Ambulatory") {
        interestedInAmbulatory.value = !interestedInAmbulatory.value;
      } else if (interest == "Hospital") {
        interestedInHospital.value = !interestedInHospital.value;
      }
      if (interestedInAmbulatory.value || interestedInHospital.value) {
        interestedInNone.value = false;
      }
    }
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      if (kDebugMode) {
        print("Email: ${emailController.text}");
        print("Worked at NYU or Northwell: ${workedAtNYUOrNorthwell.value}");
        print("Expected Commitment: ${expectedCommitment.value}");
        print("Years of Experience: ${yearsExperience.value}");
        print("Malpractice Insurance Explanation: ${malpracticeInsuranceExplanationController.text}");
        print("Credentialing Time Explanation: ${credentialingTimeController.text}");
        print("Interested in Ambulatory: ${interestedInAmbulatory.value}");
        print("Interested in Hospital: ${interestedInHospital.value}");
        print("Interested in None: ${interestedInNone.value}");
      }
    }
  }
}
