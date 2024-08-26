import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ride_hailing/views/modals/confirm_payment.dart';

import '../views/modals/confirm_location.dart';

class ConfirmLocationController extends GetxController {
  final GlobalKey<ScaffoldState> confirmLocationScaffoldKey = GlobalKey<ScaffoldState>();

  RxInt remainingTime = 180.obs; // 3 minutes = 180 seconds

  Timer? _timer;

  final MapController mapController = MapController();

  var mFromLatitude = (-1.9657168).obs;
  var mFromLongitude = (30.1422994).obs;

  var mToLatitude = (-1.966593).obs;
  var mToLongitude = (30.1420015).obs;

  var cameraAngle = 0.0.obs;

  var mapMarkerFrom = Marker(
          width: 180.0,
          height: 180.0,
          point: const LatLng(-1.9657168, 30.1422994), // Default position
          rotate: true,
          child: Image.asset('assets/images/icons/track_location_from.png'))
      .obs;

  var mapMarkerTo = Marker(
          width: 180.0,
          height: 180.0,
          point: const LatLng(-1.966593, 30.1420015), // Default position
          rotate: true,
          child: Image.asset('assets/images/icons/track_location_to.png'))
      .obs;

  @override
  void onInit() {
    super.onInit();
    startCountdown();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModal();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void showModal() {
    showCupertinoModalBottomSheet(
      context: Get.context!,
      isDismissible: false,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).width * 1.1,
          child: ConfirmLocationModal(),
        );
      },
    );
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  // Open the confirm payment modal
  void openConfirmPaymentModal(BuildContext context) {
    Get.dialog(
      ConfirmPaymentModal(),
    );
  }
}
