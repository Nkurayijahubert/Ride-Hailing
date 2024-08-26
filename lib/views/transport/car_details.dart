import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:ride_hailing/controllers/car_details.dart';

import '../../routes/app_routes.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final Map<String, dynamic> receivedData = Get.arguments;

      final CarDetailsController controller = Get.put(CarDetailsController());

      return Scaffold(
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
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${receivedData["name"]}',
                  style: const TextStyle(fontSize: 20, color: colorContentPrimary, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    Text(
                      "${receivedData["rating"]} (${receivedData["reviews"]}) reviews",
                      style: const TextStyle(fontSize: 13, color: colorContentSecondary),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Stack(
                  children: [
                    CarouselSlider(
                      carouselController: controller.carouselController,
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.85,
                      ),
                      items: controller.imageUrls.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.asset(
                                imageUrl,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Positioned(
                      top: 60,
                      left: -10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
                        onPressed: () {
                          controller.carouselController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: -10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
                        onPressed: () {
                          controller.carouselController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Specifications",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Container(
                        // width: 90,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                        decoration:
                            BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.battery_charging_full_outlined,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Max Power",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                            ),
                            Text("${receivedData["max_power"]}", style: const TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        // width: 90,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                        decoration:
                            BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                        child: Column(
                          children: [
                            const Icon(
                              CupertinoIcons.thermometer_snowflake,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Fuel",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                            ),
                            Text("${receivedData["fuelPerLitre"]} per litre", style: const TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        // width: 90,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                        decoration:
                            BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                        child: Column(
                          children: [
                            const Icon(
                              CupertinoIcons.speedometer,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Max Speed",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                            ),
                            Text("${receivedData["max_speed"]}", style: const TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        // width: 90,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                        decoration:
                            BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.auto_fix_off,
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "0-60mph",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                            ),
                            Text("2.5sec", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Car features",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      decoration:
                          BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Model"),
                          ),
                          Text("${receivedData["model"]}"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      decoration:
                          BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Capacity"),
                          ),
                          Text("${receivedData["capacity"]}"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      decoration:
                          BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Color"),
                          ),
                          Text("${receivedData["color"]}"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      decoration:
                          BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Fuel type"),
                          ),
                          Text("${receivedData["fuelType"]}"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      decoration:
                          BoxDecoration(color: colorPrimary_50, borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary, width: 1)),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Gear Type"),
                          ),
                          Text("${receivedData["transmission"]}"),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                              color: colorPrimary,
                              width: 1.5,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Book later',
                          style: TextStyle(color: colorPrimary),
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoutes.requestRent);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
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
                          Get.toNamed(AppRoutes.requestRent);
                        },
                        child: const Text(
                          'Ride Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      );
    } catch (e) {
      return const SizedBox();
    }
  }
}
