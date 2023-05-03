import 'package:dio/dio.dart';
import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/network/dio/dio_client.dart';

class API {
  final DioClient dioClient;

  API({required this.dioClient});

  Future<Response> addDoctor(
      String doctorName, String type, String yearsOfExp) async {
    try {
      final Response response = await dioClient.post(
        Constants.users,
        data: {
          'doctorName': doctorName,
          'doctorType': type,
          'yearsOfExp': yearsOfExp,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUser(String id) async {
    try {
      final Response response = await dioClient.get(
        Constants.users + '/$id',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateDoctorInfo(
      int id, String doctorName, String type, String yearsOfExp) async {
    try {
      final Response response = await dioClient.put(
        Constants.users + '/$id',
        data: {
          'doctorName': doctorName,
          'doctorType': type,
          'yearsOfExp': yearsOfExp,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await dioClient.delete(Constants.users + '/$id');
    } catch (e) {
      rethrow;
    }
  }
}
