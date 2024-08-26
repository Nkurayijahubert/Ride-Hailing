import 'package:get/get.dart';

import '../controllers/available_cars.dart';
import '../repositories/available_cars_impl.dart';
import '../services/available_cars.dart';

class AvailableCarsBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy load the dependencies when the route is accessed
    Get.lazyPut<AvailableCarsService>(() => AvailableCarsService());
    Get.lazyPut<AvailableCarsController>(
        () => AvailableCarsController(availableCarsRepository: Get.put(AvailableCarsRepositoryImpl(availableCarsService: Get.find()))));
  }
}
