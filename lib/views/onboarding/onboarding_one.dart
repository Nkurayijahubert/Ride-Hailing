import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';

import '../../routes/app_routes.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const SizedBox(),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.onBoardingThree);
            },
            child: const Text(
              "Skip",
              style: TextStyle(fontSize: 15, color: colorContentPrimary),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/onboarding/01_Onboarding.png',
                height: 300.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Anywhere you are",
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
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    value: 0.33, // 40% complete
                    strokeWidth: 4.0,
                    backgroundColor: colorPrimary_100,
                    valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen
                    Get.toNamed(AppRoutes.onBoardingTwo);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: colorPrimary, // background color
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 30.0,
                    color: Colors.white,
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
