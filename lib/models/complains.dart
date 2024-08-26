class ComplainsModel {
  final String id;
  final String userEmail;
  String heading;
  String description;
  DateTime createdAt;

  ComplainsModel({
    required this.id,
    required this.userEmail,
    required this.heading,
    required this.description,
    required this.createdAt,
  });

  // Convert Review to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': userEmail,
      'heading': heading,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // A factory method to create a Complaign instance from a JSON object
  factory ComplainsModel.fromJson(Map<String, dynamic> json) {
    return ComplainsModel(
      id: json['id'] ?? '',
      userEmail: json['userEmail'] ?? '',
      heading: json['heading'] ?? '',
      description: json['description'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }

  // Create a copy of the review with updated fields
  ComplainsModel copyWith({
    String? heading,
    String? description,
  }) {
    return ComplainsModel(
      id: id,
      userEmail: userEmail,
      heading: heading ?? this.heading,
      description: description ?? this.description,
      createdAt: createdAt,
    );
  }
}
