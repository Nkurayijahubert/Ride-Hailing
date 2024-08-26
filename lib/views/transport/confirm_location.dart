import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:ride_hailing/controllers/confirm_location.dart';

class ConfirmLocation extends StatelessWidget {
  ConfirmLocation({super.key});

  final ConfirmLocationController controller = Get.put(ConfirmLocationController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Hide the keyboard on tapping anywhere in the screen
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (currentFocus.canRequestFocus) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      }),
      child: Scaffold(
        key: controller.confirmLocationScaffoldKey,
        drawer: Drawer(
          backgroundColor: colorFFF,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100))),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: AppBar(
                  leadingWidth: 30,
                  titleSpacing: 0,
                  automaticallyImplyLeading: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: const Text(
                    "Back",
                    style: TextStyle(fontSize: 15),
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  leading: InkWell(
                    child: const Icon(Icons.arrow_back_ios, size: 25),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 17, right: 17),
                      child: Row(children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/images/icons/user_placeholder.png'),
                        )
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 17, right: 17),
                      child: Text(
                        "Nate Solomon",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 17, right: 17),
                      child: Text(
                        "nate@email.com",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              ListTile(
                dense: true,
                minLeadingWidth: 0,
                leading: const Icon(
                  Icons.bookmark_outline,
                  size: 18,
                ),
                title: const Text('History', style: TextStyle(fontSize: 14)),
                onTap: () => Navigator.pop(context),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              ListTile(
                dense: true,
                minLeadingWidth: 0,
                leading: const Icon(
                  CupertinoIcons.conversation_bubble,
                  size: 18,
                ),
                title: const Text('Complain', style: TextStyle(fontSize: 14)),
                onTap: () => Navigator.pop(context),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              ListTile(
                dense: true,
                minLeadingWidth: 0,
                leading: const Icon(
                  CupertinoIcons.group,
                  size: 18,
                ),
                title: const Text('Referral', style: TextStyle(fontSize: 14)),
                onTap: () => Navigator.pop(context),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              ListTile(
                dense: true,
                minLeadingWidth: 0,
                leading: const Icon(
                  CupertinoIcons.exclamationmark_circle,
                  size: 18,
                ),
                title: const Text('About us', style: TextStyle(fontSize: 14)),
                onTap: () => Navigator.pop(context),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              ListTile(
                dense: true,
                minLeadingWidth: 0,
                leading: const Icon(
                  Icons.settings_outlined,
                  size: 18,
                ),
                title: const Text('Settings', style: TextStyle(fontSize: 14)),
                onTap: () => Navigator.pop(context),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              ListTile(
                dense: true,
                minLeadingWidth: 0,
                leading: const Icon(
                  CupertinoIcons.question_circle,
                  size: 18,
                ),
                title: const Text('Help and Support', style: TextStyle(fontSize: 14)),
                onTap: () => Navigator.pop(context),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              ListTile(
                dense: true,
                minLeadingWidth: 0,
                leading: const Icon(
                  Icons.logout_outlined,
                  size: 18,
                ),
                title: const Text('Logout', style: TextStyle(fontSize: 14)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: Obx(() {
          return Stack(
            children: [
              FlutterMap(
                mapController: controller.mapController,
                options: MapOptions(
                  initialCenter: LatLng(controller.mFromLatitude.value, controller.mFromLongitude.value),
                  initialZoom: 18.0,
                  initialRotation: controller.cameraAngle.value,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [
                          LatLng(controller.mFromLatitude.value, controller.mFromLongitude.value),
                          LatLng(controller.mToLatitude.value, controller.mToLongitude.value),
                        ],
                        color: colorPrimary_700,
                        strokeWidth: 7.0,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [controller.mapMarkerFrom.value, controller.mapMarkerTo.value],
                  ),
                ],
              ),
              Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(shape: BoxShape.rectangle, color: colorPrimary_200),
                          child: IconButton(
                            onPressed: () => controller.confirmLocationScaffoldKey.currentState?.openDrawer(),
                            icon: const Icon(Icons.menu),
                            iconSize: 25,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(shape: BoxShape.rectangle, color: colorFFF, borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications_on_outlined),
                            iconSize: 25,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          );
        }),
      ),
    );
  }
}
