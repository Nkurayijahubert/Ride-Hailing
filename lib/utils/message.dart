// Show error snackbar
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackbar(String message) {
  Get.snackbar(
    "Error",
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}

// Show success snackbar
void showSuccessSnackbar(String message) {
  Get.snackbar(
    "Success",
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}
