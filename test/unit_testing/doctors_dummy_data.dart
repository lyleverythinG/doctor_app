import 'package:doctor_app/features/user_home/domain/model/user_model.dart';

class DoctorDummyData {
  static List<UserModel> doctors = [
    UserModel(
        doctorName: 'test',
        doctorType: 'Cardiologist',
        id: '1',
        isFavorite: 'false',
        createdAt: 'testDate',
        updatedAt: 'testDate',
        yearsOfExp: '5'),
    UserModel(
        doctorName: 'test',
        doctorType: 'Cardiologist',
        id: '1',
        isFavorite: 'false',
        createdAt: 'testDate',
        updatedAt: 'testDate',
        yearsOfExp: '5'),
    UserModel(
        doctorName: 'test',
        doctorType: 'Neurologist',
        id: '1',
        isFavorite: 'false',
        createdAt: 'testDate',
        updatedAt: 'testDate',
        yearsOfExp: '5'),
    UserModel(
        doctorName: 'test',
        doctorType: 'Pediatrician',
        id: '1',
        isFavorite: 'false',
        createdAt: 'testDate',
        updatedAt: 'testDate',
        yearsOfExp: '5'),
  ];
}
