import 'dart:convert';

import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/message.dart';
import '../routes/app_routes.dart';

class SignupController extends GetxController {
  // Create an instance of FlutterSecureStorage
  final storage = const FlutterSecureStorage();

  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var gender = ''.obs;

  // Use TextEditingController for the phone number
  final phoneNumberController = TextEditingController();

  var obscureText = true.obs;

  // Setter methods
  void setName(String value) => name.value = value;
  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  void setGender(String? value) {
    if (value != null) {
      gender.value = value;
    }
  }

  // View password
  void viewPasswordToggle() {
    obscureText.value = !obscureText.value;
  }

  // Method to check if email exists
  Future<bool> checkIfEmailExists() async {
    // Retrieve all stored data
    Map<String, String> allValues = await storage.readAll();

    // Check if the entered email already exists in the storage
    return allValues.containsKey(email.value);
  }

  // Validation method
  Future<bool> validateForm() async {
    if (name.value.isEmpty) {
      showErrorSnackbar("Please enter a valid name.");
      return false;
    }

    bool emailExists = await checkIfEmailExists();
    if (emailExists) {
      showErrorSnackbar("Email already exists. Please use a different email.");
      return false;
    }

    if (email.value.isEmpty || !email.value.contains('@')) {
      showErrorSnackbar("Please enter a valid email.");
      return false;
    }
    if (password.value.isEmpty || password.value.length < 6) {
      showErrorSnackbar("Password must be at least 6 characters.");
      return false;
    }
    if (phoneNumberController.text.isEmpty) {
      showErrorSnackbar("Please enter a valid phone number.");
      return false;
    }
    if (gender.value.isEmpty) {
      showErrorSnackbar("Please select a gender.");
      return false;
    }
    return true;
  }

  // Hash the password using bcrypt
  String hashPassword(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }

  // Method to store data securely
  Future<void> storeUserData() async {
    String hashedPassword = hashPassword(password.value); // Hash the password
    await storage.write(
        key: email.value,
        value: jsonEncode({
          'password': hashedPassword,
          'phoneNumbert': phoneNumberController.text,
          'gender': gender.value,
        }));
  }

  // open webview
  Future<void> launchInWebView(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  // Submit the form data
  void submitForm() async {
    // await storage.deleteAll();
    if (await validateForm()) {
      await storeUserData();
      showSuccessSnackbar("Signup successful!");
      // Here you can implement your signup logic, such as navigating to another page
      Get.toNamed(AppRoutes.verifyOtp);
      print('User data stored securely');
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}
