import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:ride_hailing/controllers/user.dart';

import '../controllers/home.dart';
import 'widgets/hexagon_shape.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController homeController = Get.put(HomeController());
  final UserController userController = Get.put(UserController());

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
        key: homeController.homeScaffoldKey,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 17, right: 17),
                      child: Row(children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/images/icons/user_placeholder.png'),
                        )
                      ])),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 17, right: 17),
                      child: Text(
                        "Nate Solomon",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 0,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: Text(
                        userController.loggedInEmail.value,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      )),
                  const SizedBox(
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
                mapController: homeController.mapController,
                options: MapOptions(
                  initialCenter: LatLng(homeController.mLatitude.value, homeController.mLongitude.value),
                  initialZoom: 16.0,
                  initialRotation: homeController.cameraAngle.value,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [homeController.mapMarker.value],
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
                            onPressed: () => homeController.homeScaffoldKey.currentState?.openDrawer(),
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
              Positioned(
                  bottom: 150,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: colorPrimary_700),
                                onPressed: () {},
                                child: const Text(
                                  'Rental',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(shape: BoxShape.rectangle, color: colorFFF, borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: IconButton(
                                onPressed: () {
                                  homeController.openAddressSelectionModal(context);
                                },
                                icon: Image.asset("assets/images/icons/location_target.png"),
                                iconSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: colorPrimary_100,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: colorPrimary_700),
                        ),
                        child: Column(
                          children: [
                            TextField(
                              cursorColor: colorContentPrimary,
                              controller: homeController.whereToGoController,
                              style: const TextStyle(color: colorContentLight, fontSize: 15),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                                  labelText: 'Where would you go?',
                                  labelStyle: const TextStyle(color: colorContentLight),
                                  errorStyle: const TextStyle(color: Colors.red),
                                  fillColor: colorPrimary_50,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: colorPrimary_200,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: colorPrimary_200,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        homeController.addLocationToFavourite.value ? Icons.favorite : Icons.favorite_border,
                                        color: homeController.addLocationToFavourite.value ? colorPrimary : Colors.black26,
                                        size: 21,
                                      ),
                                      onPressed: homeController.addLocationToFavouriteToggle),
                                  prefixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.search,
                                      color: Colors.black26,
                                      size: 21,
                                    ),
                                    onPressed: () {
                                      homeController.openAddressSelectionModal(context);
                                    },
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ToggleButtons(
                              direction: Axis.horizontal,
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              selectedBorderColor: colorPrimary_200,
                              selectedColor: Colors.white,
                              fillColor: colorPrimary_700,
                              color: colorContentPrimary,
                              // constraints: const BoxConstraints(minHeight: 45.0, minWidth: 160),
                              isSelected: homeController.selectedServiceChoice,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8 / 2,
                                  child: const Text(
                                    'Transport',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8 / 2,
                                  child: const Text(
                                    'Delivery',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              onPressed: (int index) {
                                for (int i = 0; i < homeController.selectedServiceChoice.length; i++) {
                                  homeController.selectedServiceChoice[i] = i == index;
                                }
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: SizedBox(
                    child: BottomNavigationBar(
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.favorite),
                          label: 'Favourite',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.wallet_travel,
                            color: Colors.transparent, // Hide the default icon
                          ),
                          label: 'Wallet',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.local_offer),
                          label: 'Offer',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'Profile',
                        ),
                      ],
                      currentIndex: homeController.selectedIndex.value,
                      selectedItemColor: colorPrimary,
                      unselectedItemColor: Colors.grey,
                      onTap: homeController.onItemTapped(homeController.selectedIndex.value),
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      type: BottomNavigationBarType.fixed,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Center(
                  heightFactor: 0.6,
                  child: GestureDetector(
                    onTap: () {
                      homeController.onItemTapped(homeController.selectedIndex.value);
                    },
                    child: ClipPath(
                      clipper: HexagonClipper(),
                      child: Container(
                        width: 70,
                        height: 80,
                        color: colorPrimary,
                        child: const Icon(
                          Icons.wallet_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
