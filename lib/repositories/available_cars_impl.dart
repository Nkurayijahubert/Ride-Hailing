import '../models/available_cars.dart';
import '../services/available_cars.dart';
import 'availabe_cars_repository.dart';

class AvailableCarsRepositoryImpl implements AvailableCarsRepository {
  final AvailableCarsService availableCarsService;

  AvailableCarsRepositoryImpl({required this.availableCarsService});

  @override
  Future<List<AvailableCarsModel>> fetchAvailableCars() async {
    return await availableCarsService.fetchAvailableCars();
  }
}
