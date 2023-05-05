class UserModel {
  String? doctorName;
  String? doctorType;
  String? yearsOfExp;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? isFavorite;

  UserModel(
      {required this.doctorName,
      required this.doctorType,
      required this.id,
      required this.isFavorite,
      required this.createdAt,
      required this.updatedAt,
      required this.yearsOfExp});

  UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    doctorName = json['doctorName'];
    doctorType = json['doctorType'];
    yearsOfExp = json['yearsOfExp'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctorName'] = doctorName;
    data['doctorType'] = doctorType;
    data['yearsOfExp'] = yearsOfExp;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isFavorite'] = isFavorite;
    return data;
  }
}
