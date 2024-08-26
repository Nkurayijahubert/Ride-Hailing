import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';

import '../../routes/app_routes.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final bool _emptyPassword = false;
  final bool _emptyPasswordConfirm = false;
  bool _obscureText = true;

  void _viewPasswordToggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  // padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  children: <Widget>[
                    const SizedBox(height: 30.0),
                    const Text(
                      "Set New password",
                      style: TextStyle(fontSize: 20, color: colorContentPrimary, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Set your new password",
                      style: TextStyle(fontSize: 15, color: colorContentLight),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25.0),
                    TextField(
                      cursorColor: Colors.white,
                      controller: _passwordController,
                      style: const TextStyle(color: colorContentLight, fontSize: 15),
                      keyboardType: TextInputType.text,
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'password',
                        labelStyle: const TextStyle(color: colorContentLight),
                        errorText: _emptyPassword ? 'Value can\'t be empty' : null,
                        errorStyle: const TextStyle(color: Colors.red),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _emptyPassword ? Colors.red : colorContentLight,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _emptyPassword ? Colors.red : colorContentLight),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _emptyPassword ? Colors.red : colorContentLight),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black26,
                              size: 21,
                            ),
                            onPressed: _viewPasswordToggle),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      cursorColor: Colors.white,
                      controller: _passwordConfirmController,
                      style: const TextStyle(color: colorContentLight, fontSize: 15),
                      keyboardType: TextInputType.text,
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'password',
                        labelStyle: const TextStyle(color: colorContentLight),
                        errorText: _emptyPasswordConfirm ? 'Value can\'t be empty' : null,
                        errorStyle: const TextStyle(color: Colors.red),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _emptyPasswordConfirm ? Colors.red : colorContentLight,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _emptyPasswordConfirm ? Colors.red : colorContentLight),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _emptyPasswordConfirm ? Colors.red : colorContentLight),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black26,
                              size: 21,
                            ),
                            onPressed: _viewPasswordToggle),
                      ),
                    ),
                    // spacer
                    const SizedBox(height: 20.0),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Atleast 1 number or a special character",
                        style: TextStyle(fontSize: 14, color: colorContentLight),
                      ),
                    ),
                    const SizedBox(height: 40.0),
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
                      'Save',
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
