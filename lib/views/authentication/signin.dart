import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:ride_hailing/controllers/signin.dart';

import '../../routes/app_routes.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    SigninController controller = Get.put(SigninController());

    return GestureDetector(
        // Hide the keyboard on tapping anywhere in the screen
        onTap: (() {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (currentFocus.canRequestFocus) {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        }),
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 45,
            titleSpacing: 0,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text(
              "Back",
              style: TextStyle(fontSize: 15),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: Obx(() {
            return SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  const Text(
                    "Sign in with your email or phone number",
                    style: TextStyle(fontSize: 20, color: colorContentPrimary, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 25.0),
                  TextField(
                    cursorColor: colorContentSecondary,
                    onChanged: controller.setEmail,
                    style: const TextStyle(color: colorContentLight, fontSize: 15),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: colorContentLight),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: colorContentLight,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: colorContentLight),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  // spacer
                  const SizedBox(height: 20.0),
                  TextField(
                    cursorColor: colorContentSecondary,
                    onChanged: controller.setPassword,
                    style: const TextStyle(color: colorContentLight, fontSize: 15),
                    keyboardType: TextInputType.text,
                    obscureText: controller.obscureText.value,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'password',
                      labelStyle: const TextStyle(color: colorContentLight),
                      errorStyle: const TextStyle(color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: colorContentLight,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: colorContentLight),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureText.value ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black26,
                            size: 21,
                          ),
                          onPressed: controller.viewPasswordToggle),
                    ),
                  ),
                  // spacer
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.setNewPassword);
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
                    onPressed: () {
                      controller.signIn();
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 1,
                        color: colorContentPrimary,
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'or',
                        style: TextStyle(
                          color: colorContentLight,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: Divider(
                        height: 1,
                        color: colorContentLight,
                      )),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 14, color: colorContentSecondary),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signup);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 14, color: colorPrimary, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 15.0),
                ],
              ),
            );
          }),
        ));
  }
}
