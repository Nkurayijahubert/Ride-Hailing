import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetailsController extends GetxController {
  final GlobalKey<ScaffoldState> carDetailScaffoldKey = GlobalKey<ScaffoldState>();

  final CarouselSliderController carouselController = CarouselSliderController();

  final List<String> imageUrls = [
    'assets/images/icons/car_2.png',
    'assets/images/icons/car_2.png',
    'assets/images/icons/car_2.png',
  ];
}
