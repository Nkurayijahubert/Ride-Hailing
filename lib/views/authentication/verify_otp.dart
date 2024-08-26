import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ride_hailing/utils/colors.dart';

import '../../routes/app_routes.dart';

class VerifyOTP extends StatelessWidget {
  const VerifyOTP({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30.0),
                    const Text(
                      "Phone verification",
                      style: TextStyle(fontSize: 20, color: colorContentPrimary, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Enter your OTP code",
                      style: TextStyle(fontSize: 15, color: colorContentLight),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25.0),
                    Container(
                      padding: const EdgeInsets.only(top: 0, right: 28, bottom: 0, left: 28),
                      child: PinCodeTextField(
                        keyboardType: TextInputType.number,
                        appContext: context,
                        length: 5,
                        onChanged: (value) {},
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldWidth: 50,
                            inactiveColor: Colors.black12,
                            activeColor: colorPrimary,
                            selectedColor: colorPrimary,
                            errorBorderColor: Colors.red),
                        onCompleted: (value) {},
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                      const Text(
                        "Didn't receive code?",
                        style: TextStyle(fontSize: 14, color: colorContentSecondary),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     new MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          "Resend again",
                          style: TextStyle(fontSize: 14, color: colorPrimary, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    top: 30,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
                    onPressed: () {
                      Get.toNamed(AppRoutes.signin);
                    },
                    child: const Text(
                      'Verify',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
