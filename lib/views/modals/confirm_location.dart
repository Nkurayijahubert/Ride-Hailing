import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../controllers/confirm_location.dart';

class ConfirmLocationModal extends StatelessWidget {
  ConfirmLocationModal({super.key});

  final ConfirmLocationController controller = Get.put(ConfirmLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // A small draggable bar at the top
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Title
            Obx(() {
              // Convert remaining seconds into minutes and seconds
              int minutes = controller.remainingTime.value ~/ 60;
              int seconds = controller.remainingTime.value % 60;
              return Text(
                'Your driver is coming in ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              );
            }),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.black12,
              height: 1,
            ),
            const SizedBox(height: 10),
            // Address Form Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset("assets/images/users/user.png", height: 50, width: 50),
                title: const Text(
                  "Sergio Ramasis",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("800m (5mins away)", style: TextStyle(fontSize: 13, color: colorContentSecondary))
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "4.9 (531 reviews)",
                          style: TextStyle(fontSize: 13, color: colorContentSecondary),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Image.asset("assets/images/icons/car_2.png", height: 60, width: 60),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.black12,
              height: 1,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Payment method",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "\$200.00",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: colorPrimary_50,
                border: Border.all(
                  color: colorPrimary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.green.withOpacity(0.2),
                //       spreadRadius: 2,
                //       blurRadius: 5,
                //       offset: const Offset(0, 3),
                //     ),
                // ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/payments/visa.png",
                    width: 40,
                    height: 40,
                    opacity: const AlwaysStoppedAnimation<double>(1.0),
                  ),
                  const SizedBox(width: 16.0),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '**** **** **** 8970',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Expires: 12/26',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
              onPressed: () {
                Navigator.pop(context);
                controller.openConfirmPaymentModal(context);
              },
              child: const Text(
                'Pay',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
