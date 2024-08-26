import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../views/modals/address_selection.dart';
import '../views/modals/confirm_address.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
  final MapController mapController = MapController();

  final whereToGoController = TextEditingController();

  var mLatitude = (-1.9657168).obs;
  var mLongitude = (30.1422994).obs;
  var cameraAngle = 0.0.obs;

  var mapMarker = Marker(
          width: 180.0,
          height: 180.0,
          point: const LatLng(-1.9657168, 30.1422994), // Default position
          rotate: true,
          child: Image.asset('assets/images/icons/map_marker.png'))
      .obs;

  var selectedIndex = 0.obs;
  var addLocationToFavourite = false.obs;
  final List<bool> selectedServiceChoice = <bool>[true, false].obs;

  onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void addLocationToFavouriteToggle() {
    addLocationToFavourite.value = !addLocationToFavourite.value;
  }

  // Open the address selection modal
  void openAddressSelectionModal(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => const AddressSelectionModal(),
    );
  }

  // Open the confirm address modal
  void openConfirmAddressModal(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).width * 0.95,
          child: const ConfirmAddressModal(),
        );
      },
    );
  }
}
