import 'package:doctor_app/features/user_home/domain/model/user_model.dart';

class SortFunctions {
  static List<UserModel> sortDoctorsByType(
      {required String doctorType, required List<UserModel> doctors}) {
    return doctors
        .where((userModel) => userModel.doctorType!.contains(doctorType))
        .toList();
  }
}
