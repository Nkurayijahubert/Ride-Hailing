import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';

import '../../routes/app_routes.dart';

class SelectTransport extends StatelessWidget {
  const SelectTransport({super.key});

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
            child: Column(
          children: [
            const Text(
              "Select your transport",
              style: TextStyle(fontSize: 20, color: colorContentPrimary, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 0.3,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.availableCar);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorPrimary,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Aligns icon and text vertically in a tight space
                        children: [
                          Image.asset(
                            "assets/images/icons/car.png",
                            height: 48, // Adjust size as needed
                            width: 48,
                          ),
                          const SizedBox(height: 18), // Spacing between icon and text
                          const Text(
                            "Car",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black, // Replace with your desired color
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 0.3,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.availableCar);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorPrimary,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Aligns icon and text vertically in a tight space
                        children: [
                          Image.asset(
                            "assets/images/icons/bike.png",
                            height: 48, // Adjust size as needed
                            width: 48,
                          ),
                          const SizedBox(height: 18), // Spacing between icon and text
                          const Text(
                            "Bike",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black, // Replace with your desired color
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 0.3,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.availableCar);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorPrimary,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Aligns icon and text vertically in a tight space
                        children: [
                          Image.asset(
                            "assets/images/icons/cycle.png",
                            height: 48, // Adjust size as needed
                            width: 48,
                          ),
                          const SizedBox(height: 18), // Spacing between icon and text
                          const Text(
                            "Cycle",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black, // Replace with your desired color
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 0.3,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.availableCar);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorPrimary,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Aligns icon and text vertically in a tight space
                        children: [
                          Image.asset(
                            "assets/images/icons/taxi.png",
                            height: 48, // Adjust size as needed
                            width: 48,
                          ),
                          const SizedBox(height: 18), // Spacing between icon and text
                          const Text(
                            "Taxi",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black, // Replace with your desired color
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
