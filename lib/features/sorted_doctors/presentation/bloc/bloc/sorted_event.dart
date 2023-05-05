part of 'sorted_bloc.dart';

abstract class SortedEvent extends Equatable {
  const SortedEvent();
}

class SortByDoctorType extends SortedEvent {
  final String doctorType;
  final List<UserModel> doctors;
  const SortByDoctorType({required this.doctorType, required this.doctors});
  @override
  List<Object> get props => [doctorType, doctors];
}
