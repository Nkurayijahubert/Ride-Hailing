import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/models/recent_places.dart';
import 'package:ride_hailing/repositories/place_repository.dart';

class RecentPlacesController extends GetxController {
  final GlobalKey<ScaffoldState> recentPlaceScaffoldKey = GlobalKey<ScaffoldState>();

  var recentPlaces = <RecentPlacesModel>[].obs; // Observable list of places
  final RecentPlacesRepository recentPlacesRepository;

  RecentPlacesController({required this.recentPlacesRepository});

  @override
  void onInit() {
    super.onInit();
    fetchRecentPlaces();
  }

  void fetchRecentPlaces() async {
    try {
      var places = await recentPlacesRepository.fetchRecentPlaces();
      recentPlaces.assignAll(places);
    } catch (e) {
      // Handle the error
      // print('Error fetching places: $e');
    }
  }
}
