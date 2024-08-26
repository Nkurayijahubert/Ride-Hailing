import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/controllers/user.dart';
import 'package:ride_hailing/views/modals/edit_complain.dart';

import '../utils/message.dart';
import '../models/complains.dart';
import '../views/modals/complain_successful.dart';

class ComplainsController extends GetxController {
  final GlobalKey<ScaffoldState> complainScaffoldKey = GlobalKey<ScaffoldState>();

  final storage = const FlutterSecureStorage();
  var reviewsList = <ComplainsModel>[].obs;
  final String storageKey = "complains";

  UserController userController = Get.put(UserController());
  late String userEmail;

  RxString headingDefaultValue = 'Vehicle not clean'.obs;
  var descriptionValue = ''.obs;

  // heading options
  List<String> headingOptions = [
    'Vehicle not clean',
    'Vehicle arrived late',
    'Vehicle has mechanical fault',
  ];

  // Setter methods
  void setDescription(String value) => descriptionValue.value = value;

  // Observable to store the selected review for editing
  var selectedReview = Rxn<ComplainsModel>();

  @override
  void onInit() {
    super.onInit();
    userEmail = userController.loggedInEmail.value;
  }

  // Initialize and load reviews for a given email
  void loadReviews(String email) async {
    List<ComplainsModel> userReviews = await getReviewsByEmail(email);
    reviewsList.value = userReviews;
  }

  // Method to add a new review
  Future<void> addReview(ComplainsModel review) async {
    if (await validateForm()) {
      List<ComplainsModel> allReviews = await getAllReviews();
      allReviews.add(review);
      await storage.write(key: storageKey, value: jsonEncode(allReviews.map((data) => data.toJson()).toList()));

      // Update the reviewsList
      reviewsList.value = allReviews;

      // Open the success modal
      openComplainSuccessModal();

      // Reset the form
      headingDefaultValue.value = 'Vehicle not clean';
      descriptionValue.value = '';
    }
  }

  // Method to get all reviews
  Future<List<ComplainsModel>> getAllReviews() async {
    String? data = await storage.read(key: storageKey);
    if (data != null) {
      try {
        List<dynamic> jsonList = jsonDecode(data);
        return jsonList.map((json) => ComplainsModel.fromJson(json)).toList();
      } catch (e) {
        return [];
      }
    }
    return [];
  }

  // Method to get reviews by email
  Future<List<ComplainsModel>> getReviewsByEmail(String email) async {
    List<ComplainsModel> allReviews = await getAllReviews();
    return allReviews.where((review) => userEmail == email).toList();
  }

  // Method to update a review by ID
  Future<void> updateReview(String reviewId, String newHeading, String newDescription) async {
    List<ComplainsModel> allReviews = await getAllReviews();

    // Find the review with the given ID
    for (var review in allReviews) {
      if (review.id == reviewId) {
        review.heading = newHeading;
        review.description = newDescription;
        review.createdAt = DateTime.now(); // Update the timestamp if needed
        break;
      }
    }

    // Save the updated list back to storage
    await storage.write(key: storageKey, value: jsonEncode(allReviews.map((r) => r.toJson()).toList()));

    // Update the reviewsList
    reviewsList.value = allReviews;

    showSuccessSnackbar("Review is successfully updated.");

    // Reset the form
    headingDefaultValue.value = 'Vehicle not clean';
    descriptionValue.value = '';
  }

  // Method to delete reviews by id
  Future<void> deleteReviewsById(String id) async {
    List<ComplainsModel> allReviews = await getAllReviews();
    allReviews.removeWhere((review) => review.id == id);
    await storage.write(key: storageKey, value: jsonEncode(allReviews.map((data) => data.toJson()).toList()));

    // Update the reviewsList
    reviewsList.value = allReviews;

    showSuccessSnackbar("Review is successfully deleted.");
  }

  selectedHeading(String heading) {
    headingDefaultValue.value = heading;
  }

  // Validation method
  Future<bool> validateForm() async {
    if (descriptionValue.value.isEmpty) {
      showErrorSnackbar("Descrip[tion can't be empty.");
      return false;
    }

    return true;
  }

  // Open the confirm payment modal
  void openComplainSuccessModal() {
    Get.dialog(
      ComplainSuccessModal(),
    );
  }

  // Open the edit review modal
  void openEditReviewModal() {
    Get.dialog(
      EditComplainModal(),
    );
  }

  // Method to set the selected review for editing
  void selectReview(ComplainsModel review) {
    selectedReview.value = review;
  }
}
