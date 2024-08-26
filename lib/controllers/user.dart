import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserController extends GetxController {
  final storage = const FlutterSecureStorage();

  // Observable to hold logged-in email
  var loggedInEmail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadLoggedInEmail();
  }

  // Method to store the logged-in email
  Future<void> storeLoggedInEmail(String email) async {
    loggedInEmail.value = email;
    await storage.write(key: 'loggedInEmail', value: email);
  }

  // Method to load the logged-in email from secure storage
  Future<void> loadLoggedInEmail() async {
    String? email = await storage.read(key: 'loggedInEmail');
    if (email != null) {
      loggedInEmail.value = email;
    }
  }

  // Method to clear the logged-in email (useful for sign-out)
  Future<void> clearLoggedInEmail() async {
    loggedInEmail.value = '';
    await storage.delete(key: 'loggedInEmail');
  }
}
