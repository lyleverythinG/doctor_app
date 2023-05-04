import 'package:dio/dio.dart';
import 'package:doctor_app/core/network/api/user_api.dart';
import 'package:doctor_app/core/network/dio/dio_exception.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';

class UserRepo {
  final API userApi;

  UserRepo({required this.userApi});

  Future<UserModel> addDoctor(
      {required String doctorName,
      required String type,
      required String yearsOfExp}) async {
    try {
      final response = await userApi.addDoctor(doctorName, type, yearsOfExp);
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.dioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
      final response = await userApi.getUser(id);
      final user = UserModel.fromJson(response.data);
      return user;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.dioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserModel> updateDoctorInfo(
      {required int index,
      required String userId,
      required String doctorName,
      required String type,
      required String yearsOfExp}) async {
    try {
      final response = await userApi.updateDoctorInfo(
          index, userId, doctorName, type, yearsOfExp);
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.dioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await userApi.deleteUser(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.dioError(e).toString();
      throw errorMessage;
    }
  }
}
