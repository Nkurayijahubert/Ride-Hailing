import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/controllers/home.dart';
import 'package:ride_hailing/controllers/recent_places.dart';

import '../../utils/colors.dart';

class AddressSelectionModal extends StatelessWidget {
  const AddressSelectionModal({super.key});

  @override
  Widget build(BuildContext context) {
    final RecentPlacesController placeController = Get.find<RecentPlacesController>();
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(body: Obx(
      () {
        if (placeController.recentPlaces.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TextField(
                          cursorColor: colorContentPrimary,
                          style: const TextStyle(color: colorContentLight, fontSize: 15),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                              labelText: 'Current location',
                              labelStyle: const TextStyle(color: colorContentLight),
                              errorStyle: const TextStyle(color: Colors.red),
                              fillColor: Colors.transparent,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: colorPrimary,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: colorPrimary_200,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: IconButton(
                                icon: Image.asset(
                                  "assets/images/icons/location_target.png",
                                  color: colorPrimary,
                                ),
                                onPressed: () {},
                              )),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: colorContentPrimary,
                          style: const TextStyle(color: colorContentLight, fontSize: 15),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                              labelText: 'United States',
                              labelStyle: const TextStyle(color: colorContentLight),
                              errorStyle: const TextStyle(color: Colors.red),
                              fillColor: Colors.transparent,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.location_pin,
                                  color: Colors.black26,
                                  size: 21,
                                ),
                                onPressed: () {},
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Colors.black12,
                    height: 1,
                  ),
                  const SizedBox(height: 20),
                  // Recent Places
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recent places',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: placeController.recentPlaces.length,
                          itemBuilder: (context, index) {
                            final recentPlace = placeController.recentPlaces[index];
                            return ListTile(
                              leading: const Icon(Icons.location_pin),
                              title: Text(recentPlace.name),
                              subtitle: Text(recentPlace.address),
                              trailing: Text(
                                "${recentPlace.distance.toString()}km",
                                style: const TextStyle(fontSize: 14),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                homeController.openConfirmAddressModal(context);
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    ));
  }
}
