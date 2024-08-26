import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';

import '../../routes/app_routes.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leadingWidth: 45,
        titleSpacing: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
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
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/icons/done.png"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Thank you",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Your booking has been placed sent to Md. Sharif Ahmed",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorPrimary_700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.confirmLocation);
                  },
                  child: const Text(
                    'Confirm Ride',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30.0),
              ]))),
    );
  }
}
