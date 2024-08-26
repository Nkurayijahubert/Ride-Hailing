import 'package:get/get.dart';
import 'package:ride_hailing/repositories/place_repository_impl.dart';

import '../controllers/recent_places.dart';
import '../services/recent_places.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy load the dependencies when the route is accessed
    Get.lazyPut<RecentPlacesService>(() => RecentPlacesService());
    Get.lazyPut<RecentPlacesController>(() => RecentPlacesController(recentPlacesRepository: Get.put(RecentPlacesRepositoryImpl(placeService: Get.find()))));
  }
}
