import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:ride_hailing/controllers/available_cars.dart';

import '../../routes/app_routes.dart';

class AvailableCar extends StatelessWidget {
  const AvailableCar({super.key});

  @override
  Widget build(BuildContext context) {
    final AvailableCarsController carsController = Get.find<AvailableCarsController>();

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
      body: Obx(() {
        if (carsController.availableCarsList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Avaiable cars for ride",
                    style: TextStyle(fontSize: 20, color: colorContentPrimary, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    "18 cars found",
                    style: TextStyle(fontSize: 12, color: colorContentSecondary),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 30.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final car = carsController.availableCarsList[0];
                      return Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(
                            color: colorPrimary,
                            width: 0.8,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  car.name,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${car.transmission}   |   ${car.seats.toString()} seats   |   ${car.fuelType}",
                                      style: const TextStyle(fontSize: 12, color: colorContentLight),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 14,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("800m (5mins away)", style: TextStyle(fontSize: 13))
                                      ],
                                    )
                                  ],
                                ),
                                trailing: Image.asset(
                                  car.image,
                                  // width: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
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
                                          Get.toNamed(AppRoutes.carDetails, arguments: {
                                            'name': car.name,
                                            'reviews': car.reviews,
                                            'starsReviews': car.rating,
                                            'transmission': car.transmission,
                                            'seats': car.seats,
                                            'fuelType': car.fuelType,
                                            'image': car.image,
                                            'fuelPerLitre': car.fuelPerLitre,
                                            'max_speed': car.maxSpeed,
                                            'max_power': car.maxPower,
                                            'model': car.model,
                                            'capacity': car.capacity,
                                            'color': car.color,
                                          });
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
                                          Get.toNamed(AppRoutes.carDetails, arguments: {
                                            'name': car.name,
                                            'reviews': car.reviews,
                                            'rating': car.rating,
                                            'transmission': car.transmission,
                                            'seats': car.seats,
                                            'fuelType': car.fuelType,
                                            'image': car.image,
                                            'fuelPerLitre': car.fuelPerLitre,
                                            'max_speed': car.maxSpeed,
                                            'max_power': car.maxPower,
                                            'model': car.model,
                                            'capacity': car.capacity,
                                            'color': car.color,
                                          });
                                        },
                                        child: const Text(
                                          'Ride Now',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ));
        }
      }),
    );
  }
}
