import '../models/available_cars.dart';

abstract class AvailableCarsRepository {
  Future<List<AvailableCarsModel>> fetchAvailableCars();
}
