class AvailableCarsModel {
  final String name;
  final String transmission;
  final String fuelType;
  final String image;
  final String maxPower;
  final String maxSpeed;
  final String fuelPerLitre;
  final String color;
  final String model;
  final String capacity;
  final int seats;
  final int reviews;
  final double rating;

  AvailableCarsModel({
    required this.image,
    required this.maxPower,
    required this.maxSpeed,
    required this.fuelPerLitre,
    required this.color,
    required this.model,
    required this.capacity,
    required this.seats,
    required this.reviews,
    required this.rating,
    required this.name,
    required this.transmission,
    required this.fuelType,
  });

  // A factory method to create a Place instance from a JSON object
  factory AvailableCarsModel.fromJson(Map<String, dynamic> json) {
    return AvailableCarsModel(
      name: json['name'],
      transmission: json['address'],
      fuelType: json['distance'],
      image: json['image'],
      maxPower: json['max_power'],
      maxSpeed: json['max_speed'],
      fuelPerLitre: json['fuel_per_litre'],
      color: json['color'],
      model: json['model'],
      capacity: json['capactiy'],
      seats: json['seats'],
      reviews: json['reviews'],
      rating: json['stars_review'],
    );
  }
}
