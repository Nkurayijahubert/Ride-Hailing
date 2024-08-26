import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:ride_hailing/controllers/signup.dart';

import '../../routes/app_routes.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());

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
                  "Sign up with your email or phone number",
                  style: TextStyle(fontSize: 20, color: colorContentPrimary, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 25.0),
                TextField(
                  cursorColor: colorContentLight,
                  onChanged: controller.setName,
                  style: const TextStyle(color: colorContentLight, fontSize: 15),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Name',
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
                  cursorColor: colorContentLight,
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
                IntlPhoneField(
                  initialCountryCode: 'RW',
                  pickerDialogStyle: PickerDialogStyle(backgroundColor: colorFFF),
                  controller: controller.phoneNumberController,
                  decoration: InputDecoration(
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
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorContentLight),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (phone) {},
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.only(top: 4, right: 15, bottom: 4, left: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(9)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: colorFFF,
                      isExpanded: true,
                      value: controller.gender.value.isEmpty ? null : controller.gender.value,
                      hint: const Text('Select Gender'),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: colorContentLight,
                      ),
                      items: ['Male', 'Female'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: controller.setGender,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  cursorColor: colorContentLight,
                  onChanged: controller.setPassword,
                  style: const TextStyle(color: colorContentLight, fontSize: 15),
                  keyboardType: TextInputType.text,
                  obscureText: controller.obscureText.value,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'password',
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
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: colorPrimary,
                      size: 17,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        const TextSpan(
                          text: 'By signing up. you agree to the ',
                          style: TextStyle(color: colorContentSecondary, fontSize: 12),
                        ),
                        TextSpan(
                            text: 'Terms of Service',
                            style: const TextStyle(color: colorPrimary_700, fontSize: 12, fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                final Uri toLaunch = Uri(scheme: 'https', host: 'www.rssb.rw', path: '/');
                                controller.launchInWebView(toLaunch);
                              }),
                        const TextSpan(
                          text: ' and ',
                          style: TextStyle(color: colorContentSecondary, fontSize: 12),
                        ),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(color: colorPrimary_700, fontSize: 12, fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                final Uri toLaunch = Uri(scheme: 'https', host: 'www.rssb.rw', path: '/');
                                controller.launchInWebView(toLaunch);
                              }),
                      ])),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
                  onPressed: () {
                    controller.submitForm();
                  },
                  child: const Text(
                    'Sign Up',
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
                    "Already have an account?",
                    style: TextStyle(fontSize: 14, color: colorContentSecondary),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.signin);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 14, color: colorPrimary, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    ),
                  ),
                ]),
                const SizedBox(height: 15.0),
              ],
            ),
          );
        }),
      ),
    );
  }
}
