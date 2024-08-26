import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RequestRentController extends GetxController {
  final GlobalKey<ScaffoldState> requestRentScaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedIndex = 0.obs;

  updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
