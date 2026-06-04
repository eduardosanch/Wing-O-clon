class UserModel {

  final int id;
  final String name;
  final String email;
  final String phone;
  final int points;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.points,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'] ?? '',
      points: json['points'] ?? 0,
    );
  }
}