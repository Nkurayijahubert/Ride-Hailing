import 'dart:convert';

import 'package:bcrypt/bcrypt.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/message.dart';
import '../routes/app_routes.dart';
import 'user.dart';

class SigninController extends GetxController {
  UserController userController = Get.put(UserController());

  // Create an instance of FlutterSecureStorage
  final storage = const FlutterSecureStorage();

  var email = ''.obs;
  var password = ''.obs;

  var obscureText = true.obs;

  // Setter methods
  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  // View password
  void viewPasswordToggle() {
    obscureText.value = !obscureText.value;
  }

  // Method to retrieve user data
  Future<Map<String, dynamic>?> getUserData(String email) async {
    String? userData = await storage.read(key: email);
    if (userData != null) {
      return jsonDecode(userData);
    }
    return null;
  }

  // Method to verify password using bcrypt
  bool verifyPassword(String enteredPassword, String storedHashedPassword) {
    return BCrypt.checkpw(enteredPassword, storedHashedPassword);
  }

  // Method to handle sign-in process
  Future<void> signIn() async {
    if (await validateForm()) {
      // Retrieve user data based on email
      Map<String, dynamic>? userData = await getUserData(email.value);

      if (userData != null) {
        String storedHashedPassword = userData['password'];
        // Verify entered password with stored hashed password
        if (verifyPassword(password.value, storedHashedPassword)) {
          // Password matches, sign-in successful
          showSuccessSnackbar("Sign-in successful!");

          // Store the logged-in email
          userController.storeLoggedInEmail(email.value);

          // Open the home screen
          Get.toNamed(AppRoutes.home);
        } else {
          // Password doesn't match
          showErrorSnackbar("Incorrect password. Please try again.");
        }
      } else {
        // User data not found
        showErrorSnackbar("Email not found. Please sign up first.");
      }
    }
  }

  // Validation method
  Future<bool> validateForm() async {
    if (email.value.isEmpty || !email.value.contains('@')) {
      showErrorSnackbar("Please enter a valid email.");
      return false;
    }
    if (password.value.isEmpty || password.value.length < 6) {
      showErrorSnackbar("Password must be at least 6 characters.");
      return false;
    }

    return true;
  }
}
