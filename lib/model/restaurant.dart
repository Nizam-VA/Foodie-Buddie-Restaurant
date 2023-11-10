class Restaurant {
  final String name;
  final String description;
  final String email;
  final String pinCode;
  final String password;
  final String rePassword;

  Restaurant({
    required this.name,
    required this.description,
    required this.email,
    required this.pinCode,
    required this.password,
    required this.rePassword,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      description: json['description'],
      email: json['email'],
      pinCode: json['pinCode'],
      password: json['password'],
      rePassword: json['confirmPassword'],
    );
  }
}
