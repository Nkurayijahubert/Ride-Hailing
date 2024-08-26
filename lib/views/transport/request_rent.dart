import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:ride_hailing/controllers/request_rent.dart';

import '../../routes/app_routes.dart';

class RequestRent extends StatelessWidget {
  const RequestRent({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestRentController controller = Get.put(RequestRentController());

    // payment methods
    final List<Map<String, String>> paymentMethods = [
      {
        'icon': 'assets/images/payments/visa.png',
        'title': '**** **** **** 8970',
        'subtitle': 'Expires: 12/26',
      },
      {
        'icon': 'assets/images/payments/mastercard.png',
        'title': '**** **** **** 8970',
        'subtitle': 'Expires: 12/26',
      },
      {
        'icon': 'assets/images/payments/paypal.png',
        'title': 'mailaddress@mail.com',
        'subtitle': 'Expires: 12/26',
      },
      {
        'icon': 'assets/images/payments/cash.png',
        'title': 'Cash',
        'subtitle': 'Expires: 12/26',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 45,
        titleSpacing: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Request for rent",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
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
                  const SizedBox(
                    height: 10,
                  ),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration:
                        BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mustang Shelby GT',
                              style: TextStyle(fontSize: 16, color: colorContentPrimary, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange),
                                Text(
                                  "4.9 (531 reviews)",
                                  style: TextStyle(fontSize: 13, color: colorContentSecondary),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        )),
                        Image.asset("assets/images/icons/car_2.png", height: 50, width: 50),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Charge",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: 'Mustang/',
                              style: TextStyle(color: colorContentPrimary, fontSize: 14),
                            ),
                            TextSpan(
                              text: 'per hours',
                              style: TextStyle(color: colorContentSecondary, fontSize: 12),
                            ),
                          ]),
                        ),
                      ),
                      const Text("\$200", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: 'Vat',
                              style: TextStyle(color: colorContentPrimary, fontSize: 14),
                            ),
                            TextSpan(
                              text: '(5%)',
                              style: TextStyle(color: colorContentSecondary, fontSize: 12),
                            ),
                          ]),
                        ),
                      ),
                      const Text("\$20", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    "Select payment method",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: paymentMethods.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.updateSelectedIndex(index);
                          },
                          child: Obx(() {
                            final isSelected = controller.selectedIndex.value == index;
                            final paymentMethod = paymentMethods[index];

                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: colorPrimary_50,
                                border: Border.all(
                                  color: isSelected ? colorPrimary : colorPrimary_50,
                                  width: isSelected ? 2.0 : 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    paymentMethod['icon']!,
                                    width: 30,
                                    height: 30,
                                    opacity: isSelected ? const AlwaysStoppedAnimation<double>(1.0) : const AlwaysStoppedAnimation<double>(0.4),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        paymentMethod['title']!,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected ? Colors.black : Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        paymentMethod['subtitle']!,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: isSelected ? Colors.black54 : Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        );
                      }),
                  const SizedBox(height: 30.0),
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
                      Get.toNamed(AppRoutes.thankYou);
                    },
                    child: const Text(
                      'Confirm Ride',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                ]),
              ))),
    );
  }
}
