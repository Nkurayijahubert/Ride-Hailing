class RecentPlacesModel {
  final String name;
  final String address;
  final double distance;

  RecentPlacesModel({
    required this.name,
    required this.address,
    required this.distance,
  });

  // A factory method to create a Place instance from a JSON object
  factory RecentPlacesModel.fromJson(Map<String, dynamic> json) {
    return RecentPlacesModel(
      name: json['name'],
      address: json['address'],
      distance: json['distance'],
    );
  }
}
