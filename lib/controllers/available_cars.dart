import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/models/available_cars.dart';

import '../repositories/availabe_cars_repository.dart';

class AvailableCarsController extends GetxController {
  final GlobalKey<ScaffoldState> availableCarScaffoldKey = GlobalKey<ScaffoldState>();

  var availableCarsList = <AvailableCarsModel>[].obs; // Observable list of places
  final AvailableCarsRepository availableCarsRepository;

  AvailableCarsController({required this.availableCarsRepository});

  @override
  void onInit() {
    super.onInit();
    fetchAvailableCars();
  }

  void fetchAvailableCars() async {
    try {
      var cars = await availableCarsRepository.fetchAvailableCars();
      availableCarsList.assignAll(cars);
    } catch (e) {
      // Handle the error
      print('Error fetching cars: $e');
    }
  }
}
