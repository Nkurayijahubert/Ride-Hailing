import 'package:ride_hailing/models/recent_places.dart';

abstract class RecentPlacesRepository {
  Future<List<RecentPlacesModel>> fetchRecentPlaces();
}
