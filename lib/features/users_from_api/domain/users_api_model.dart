import 'package:hive/hive.dart';

class UserApiModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? firstName;

  @HiveField(3)
  String? lastName;

  @HiveField(4)
  String? avatar;

  UserApiModel({
    required this.email,
    required this.firstName,
    required this.id,
    required this.avatar,
    required this.lastName,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
