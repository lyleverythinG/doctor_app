import 'package:doctor_app/features/user_home/data/repository/sort_functions.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'doctors_dummy_data.dart';

void main() {
  test('Test Sort Doctors by Type Functionality', () {
    // In this test, we passed 'Cardiologist' in the sortDoctorsByType function.
    final List<UserModel> doctorsResult = SortFunctions.sortDoctorsByType(
        doctors: DoctorDummyData.doctors, doctorType: 'Cardiologist');
    // Will return false if any of the doctor type is not Cardiologist from the result returned by the function.
    bool allDoctorTypeIsCardio =
        !doctorsResult.any((doctor) => doctor.doctorType != "Cardiologist");
    // The expect method will passed only if allDoctorType from doctorsResult are Cardiologist.
    expect(allDoctorTypeIsCardio, true);
  });
}
