import 'dart:convert';
import 'package:ride_hailing/models/available_cars.dart';

class AvailableCarsService {
  Future<List<AvailableCarsModel>> fetchAvailableCars() async {
    List<AvailableCarsModel> list = [];
    final response = {
      'statusCode': 200,
      'body': '''
        [
          {
            "name": "BMW Cabrio",
            "reviews": 531,
            "star_reviews": 4.5, 
            "features": {
              "seats": 4,
              "model": "GT5000",
              "capacity": "760hp",
              "color": "red",
              "fuel_type": "Octane",
              "transmission": "Automatic"
            },
            "specifications": {
              "max_power": "250hp",
              "fuel_per_litre": "10km",
              "max_speed": "230kph"
            } 
          }
        ]
      '''
    };

    if (response['statusCode'] == 200) {
      final responseBody = json.decode(response['body'] as String);
      for (var jsonList in responseBody) {
        AvailableCarsModel model = AvailableCarsModel(
          name: jsonList['name'],
          reviews: jsonList['reviews'],
          image: 'assets/images/icons/car_1.png',
          rating: jsonList['star_reviews'],
          seats: jsonList['features']['seats'],
          model: jsonList['features']['model'],
          capacity: jsonList['features']['capacity'],
          color: jsonList['features']['color'],
          fuelType: jsonList['features']['fuel_type'],
          transmission: jsonList['features']['transmission'],
          maxPower: jsonList['specifications']['max_power'],
          fuelPerLitre: jsonList['specifications']['fuel_per_litre'],
          maxSpeed: jsonList['specifications']['max_speed'],
        );

        list.add(model);
      }
      return list;
    } else {
      throw Exception('Failed to fetch recent places');
    }
  }
}
