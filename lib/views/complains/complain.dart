import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/controllers/user.dart';
import 'package:ride_hailing/models/complains.dart';
import 'package:uuid/uuid.dart';

import '../../utils/colors.dart';
import '../../controllers/complains.dart';

class Complains extends StatelessWidget {
  const Complains({super.key});

  @override
  Widget build(BuildContext context) {
    final ComplainsController controller = Get.put(ComplainsController());
    final UserController userController = Get.put(UserController());
    String currentUserEmail = userController.loggedInEmail.value;

    // Load reviews when the widget is built
    controller.loadReviews(currentUserEmail);

    return Scaffold(
        key: controller.complainScaffoldKey,
        appBar: AppBar(
          leadingWidth: 45,
          titleSpacing: 0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "Complains",
            style: TextStyle(fontSize: 15),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Obx(
          () {
            // print(controller.reviewsList.length);
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 4, right: 15, bottom: 4, left: 15),
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: Colors.transparent, border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(9)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  dropdownColor: colorFFF,
                                  isExpanded: true,
                                  value: controller.headingDefaultValue.value,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: colorContentLight,
                                  ),
                                  items: controller.headingOptions.map((String headings) {
                                    return DropdownMenuItem(
                                      value: headings,
                                      child: Text(
                                        headings,
                                        style: const TextStyle(color: colorContentLight, fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    controller.selectedHeading(newValue!);
                                  }),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            cursorColor: colorContentPrimary,
                            onChanged: controller.setDescription,
                            style: const TextStyle(color: colorContentLight, fontSize: 15),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            textCapitalization: TextCapitalization.sentences,
                            // maxLength: 10,
                            maxLines: 4,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
                              alignLabelWithHint: true,
                              labelText: 'Write your complain here (minimum 10 \nwords)',
                              labelStyle: const TextStyle(color: colorContentLight),
                              errorStyle: const TextStyle(color: Colors.red),
                              fillColor: Colors.transparent,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
                        onPressed: () {
                          ComplainsModel model = ComplainsModel(
                            heading: controller.headingDefaultValue.value,
                            description: controller.descriptionValue.value,
                            userEmail: currentUserEmail,
                            id: const Uuid().v4(),
                            createdAt: DateTime.now(),
                          );

                          controller.addReview(model);
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Recent Reviews
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Recent Reviews',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          controller.reviewsList.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.reviewsList.length,
                                  itemBuilder: (context, index) {
                                    final complain = controller.reviewsList[index];

                                    // format the date
                                    String formattedDate = complain.createdAt.toLocal().toString().split(' ')[0];

                                    return Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                        decoration:
                                            BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: colorPrimary_200, width: 1)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 10),
                                                      child: Text(complain.heading, style: const TextStyle(fontWeight: FontWeight.w500))),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      complain.description,
                                                      style: const TextStyle(color: colorContentSecondary, fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(Icons.edit_outlined),
                                                      onPressed: () {
                                                        controller.selectedReview(complain);
                                                        controller.openEditReviewModal();
                                                        // Navigator.pushNamed(context, AppRoutes.complains);
                                                      },
                                                      // color: colorDanger,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    IconButton(
                                                      icon: const Icon(Icons.delete_outline),
                                                      color: colorDanger,
                                                      onPressed: () {
                                                        controller.deleteReviewsById(complain.id);
                                                      },
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  formattedDate,
                                                  style: const TextStyle(color: colorContentSecondary),
                                                )
                                              ],
                                            ),
                                          ],
                                        ));
                                  },
                                )
                              : Container(
                                  margin: const EdgeInsets.symmetric(vertical: 20),
                                  child: const Center(
                                    child: Text("No reviews are found"),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
