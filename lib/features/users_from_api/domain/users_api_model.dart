class UserApiModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserApiModel(
      {required this.email,
      required this.firstName,
      required this.id,
      required this.avatar,
      required this.lastName});

  UserApiModel.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctorName'] = email;
    data['doctorType'] = firstName;
    data['yearsOfExp'] = lastName;
    data['id'] = id;
    data['createdAt'] = avatar;
    return data;
  }
}
