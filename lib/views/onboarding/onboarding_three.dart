import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';

import '../../routes/app_routes.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const SizedBox(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/onboarding/03_Onboarding.png',
                height: 300.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Book your car",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Text(
                "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: 65,
                  height: 65,
                  child: CircularProgressIndicator(
                    value: 1, // 100% complete
                    strokeWidth: 4.0,
                    backgroundColor: colorPrimary_100,
                    valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.welcome);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: colorPrimary, // background color
                  ),
                  child: const Text(
                    "Go",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: colorFFF,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
