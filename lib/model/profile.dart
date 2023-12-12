class Profile {
  final String description;
  final String email;
  final String name;
  final String pinCode;
  final int sellerId;
  final String status;

  Profile({
    required this.description,
    required this.email,
    required this.name,
    required this.pinCode,
    required this.sellerId,
    required this.status,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      description: json['description'],
      email: json['email'],
      name: json['name'],
      pinCode: json['pinCode'],
      sellerId: json['sellerId'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson(Profile profile) {
    final Map<String, dynamic> data = {
      'description': profile.description,
      'email': profile.email,
      'name': profile.name,
      'pinCode': profile.pinCode,
      'sellerId': profile.sellerId,
      'status': profile.status,
    };

    return data;
  }
}
