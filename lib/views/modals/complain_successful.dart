import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../controllers/confirm_location.dart';
import '../../routes/app_routes.dart';

class ComplainSuccessModal extends StatelessWidget {
  ComplainSuccessModal({super.key});

  final ConfirmLocationController controller = Get.put(ConfirmLocationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/icons/done.png"),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Send successful",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Your complain has been send successful",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: colorContentLight),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
                          onPressed: () {
                            Navigator.pop(context);
                            Get.offAllNamed(AppRoutes.home);
                          },
                          child: const Text(
                            'Back Home',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
