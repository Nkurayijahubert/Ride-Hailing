import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestRentController extends GetxController {
  final GlobalKey<ScaffoldState> requestRentScaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedIndex = 0.obs;

  updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
