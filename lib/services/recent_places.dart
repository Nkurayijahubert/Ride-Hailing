import 'dart:convert';
import 'package:ride_hailing/models/recent_places.dart';

class RecentPlacesService {
  Future<List<RecentPlacesModel>> fetchRecentPlaces() async {
    final response = {
      'statusCode': 200,
      'body': '''
        [
          {"name": "Office", "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486 ", "distance": 2.7},
          {"name": "Coffee shop", "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486 ", "distance": 1.0},
          {"name": "Shopping center", "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486 ", "distance": 4.9},
          {"name": "shopping mall", "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486 ", "distance": 4.0}
        ]
      '''
    };

    if (response['statusCode'] == 200) {
      String responseBody = response['body'] as String;
      List<dynamic> jsonList = json.decode(responseBody);
      return jsonList.map((json) => RecentPlacesModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch recent places');
    }
  }
}
