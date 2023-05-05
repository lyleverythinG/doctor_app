import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/user_home/data/repository/sort_functions.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:equatable/equatable.dart';

part 'sorted_event.dart';
part 'sorted_state.dart';

class SortedBloc extends Bloc<SortedEvent, SortedState> {
  final List<UserModel> sortedResult = [];
  SortedBloc() : super(SortedInitial()) {
    on<SortByDoctorType>((event, emit) {
      emit(const SortedUsersLoadingState());
      final sortedDoctors = SortFunctions.sortDoctorsByType(
          doctorType: event.doctorType, doctors: event.doctors);
      if (sortedDoctors.isNotEmpty) {
        emit(SortedDoctorsResult(sortedDoctors: sortedDoctors));
      } else {
        emit(const EmptySortedResult());
      }
    });
  }
}
