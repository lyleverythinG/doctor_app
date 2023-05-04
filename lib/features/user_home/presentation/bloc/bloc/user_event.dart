part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class CreateUserDoctor extends UserEvent {
  final String doctorName;
  final String doctorType;
  final String yearsOfExperience;
  const CreateUserDoctor({
    required this.doctorName,
    required this.doctorType,
    required this.yearsOfExperience,
  });
  @override
  List<Object> get props => [
        doctorName,
        doctorType,
        yearsOfExperience,
      ];
}

class GetDoctorInfo extends UserEvent {
  final String userId;
  const GetDoctorInfo({
    required this.userId,
  });
  @override
  List<Object> get props => [
        userId,
      ];
}

class UpdateDoctorInfo extends UserEvent {
  final String userId;
  final int userIndex;
  final String doctorName;
  final String doctorType;
  final String yearsOfExp;
  final String createdAt;

  const UpdateDoctorInfo(
      {required this.userId,
      required this.userIndex,
      required this.doctorName,
      required this.doctorType,
      required this.yearsOfExp,
      required this.createdAt});
  @override
  List<Object> get props =>
      [userId, userIndex, doctorName, doctorType, yearsOfExp, createdAt];
}

class UserUpdate extends UserEvent {
  final List<UserModel> users;
  const UserUpdate({required this.users});
  @override
  List<Object> get props => [users];
}
