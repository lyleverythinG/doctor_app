import 'package:doctor_app/features/user_home/data/repository/sort_functions.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Added dummy data for testing sort/filter functionality.
  final List<UserModel> doctors = [
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
  test('Test Sort Doctors by Type Functionality', () {
    // In this test, we passed 'Cardiologist' in the sortDoctorsByType function.
    final List<UserModel> doctorsResult = SortFunctions.sortDoctorsByType(
        doctors: doctors, doctorType: 'Cardiologist');
    // this code will return false if any of the doctor type is not Cardiologist from the result returned by the function.
    bool allDoctorTypeIsCardio =
        !doctorsResult.any((doctor) => doctor.doctorType != "Cardiologist");
    // the expect method will passed only if allDoctorType from doctorsResult are Cardiologist.
    expect(allDoctorTypeIsCardio, true);
  });
}
