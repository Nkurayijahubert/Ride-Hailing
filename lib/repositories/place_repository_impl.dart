import 'package:ride_hailing/models/recent_places.dart';
import 'package:ride_hailing/repositories/place_repository.dart';
import 'package:ride_hailing/services/recent_places.dart';

class RecentPlacesRepositoryImpl implements RecentPlacesRepository {
  final RecentPlacesService placeService;

  RecentPlacesRepositoryImpl({required this.placeService});

  @override
  Future<List<RecentPlacesModel>> fetchRecentPlaces() async {
    return await placeService.fetchRecentPlaces();
  }
}
