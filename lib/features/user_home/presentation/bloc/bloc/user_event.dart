part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class CreateUserDoctor extends UserEvent {
  final String doctorName;
  final String doctorType;
  final String yearsOfExperience;

  const CreateUserDoctor(
      {required this.doctorName,
      required this.doctorType,
      required this.yearsOfExperience});
  @override
  List<Object> get props => [doctorName, doctorType, yearsOfExperience];
}
