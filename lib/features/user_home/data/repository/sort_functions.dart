import 'package:doctor_app/core/packages/user_home_feature_packages/user_home_related_packages.dart';

class SortFunctions {
  static List<UserModel> sortDoctorsByType(
      {required String doctorType, required List<UserModel> doctors}) {
    return doctors
        .where((userModel) => userModel.doctorType!.contains(doctorType))
        .toList();
  }
}
