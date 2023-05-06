import 'package:dio/dio.dart';
import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/network/dio/dio_client.dart';

class API {
  final DioClient dioClient;

  API({required this.dioClient});

  Future<Response> addDoctor(
    String doctorName,
    String type,
    String yearsOfExp,
  ) async {
    try {
      final Response response = await dioClient.post(
        Constants.users,
        data: {
          'doctorName': doctorName,
          'doctorType': type,
          'yearsOfExp': yearsOfExp,
          'isFavorite': 'false',
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUsersFromApi() async {
    try {
      // Fetches the users from the response of the api page 2.
      final Response response = await dioClient.get(
        Constants.gettingUsersFromApiUrl,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateDoctorInfo(int index, String userId, String doctorName,
      String type, String yearsOfExp) async {
    try {
      final Response response = await dioClient.put(
        Constants.users + '/$userId',
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

  Future<Response> removeDoctFromFavorites(
    String userId,
  ) async {
    try {
      final Response response = await dioClient.put(
        Constants.users + '/$userId',
        data: {
          'isFavorite': 'false',
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addDoctToFavorite(
    String userId,
  ) async {
    try {
      final Response response = await dioClient.put(
        Constants.users + '/$userId',
        data: {
          'isFavorite': 'true',
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> removeFromFavorite(int index, String userId,
      String doctorName, String type, String yearsOfExp) async {
    try {
      final Response response = await dioClient.put(
        Constants.users + '/$userId',
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

  Future<void> deleteUser(String id) async {
    try {
      await dioClient.delete(Constants.users + '/$id');
    } catch (e) {
      rethrow;
    }
  }
}
