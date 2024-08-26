import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../routes/app_routes.dart';

class ConfirmAddressModal extends StatelessWidget {
  const ConfirmAddressModal({super.key});

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
          child: Stack(
            children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
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
                const Text(
                  'Select address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.black12,
                  height: 1,
                ),
                const SizedBox(height: 20),
                // Address Form Fields
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.location_pin,
                          color: colorDanger,
                        ),
                        title: Text(
                          "Current location",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                          style: TextStyle(fontSize: 11),
                        ),
                        trailing: SizedBox(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_pin,
                          color: colorPrimary,
                        ),
                        title: Text("Office", style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text(
                          "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                          style: TextStyle(fontSize: 11),
                        ),
                        trailing: Text(
                          "1.1km",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
                  onPressed: () {
                    Get.toNamed(AppRoutes.selectTransport);
                  },
                  child: const Text(
                    'Confirm Location',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
              const Positioned(
                bottom: 120,
                left: 35,
                child: SizedBox(height: 55, child: VerticalDivider(color: colorPrimary)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
