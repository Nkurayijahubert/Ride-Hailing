import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing/controllers/complains.dart';

import '../../utils/colors.dart';

class EditComplainModal extends StatelessWidget {
  EditComplainModal({super.key});

  final ComplainsController controller = Get.put(ComplainsController());

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    descriptionController.text = controller.selectedReview.value!.description;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 70,
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
                              const SizedBox(height: 40),
                              TextField(
                                cursorColor: colorContentPrimary,
                                controller: descriptionController,
                                onChanged: controller.setDescription,
                                style: const TextStyle(color: colorContentLight, fontSize: 15),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.words,
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
                          onPressed: () {
                            String id = controller.selectedReview.value!.id;
                            controller.updateReview(id, controller.headingDefaultValue.value, controller.descriptionValue.value);
                            Navigator.pop(context);

                            controller.openComplainSuccessModal();
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
