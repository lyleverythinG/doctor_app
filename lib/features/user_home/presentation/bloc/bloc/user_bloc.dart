import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  List<UserModel> users = [];
  UserBloc({required this.userRepo}) : super(UserInitial()) {
    on<CreateUserDoctor>((event, emit) async {
      // adds user
      final userDoctor = await userRepo.addDoctor(
          doctorName: event.doctorName,
          type: event.doctorType,
          yearsOfExp: event.yearsOfExperience);
      users.add(userDoctor);
      emit(UserUpdated(users: users));
    });
    on<UpdateDoctorInfo>((event, emit) async {
      // updates user info
      emit(const LoadingState());
      final updatedUser = await userRepo.updateDoctorInfo(
        id: event.userIndex,
        doctorName: event.doctorName,
        type: event.doctorType,
        yearsOfExp: event.yearsOfExp,
      );
      List<UserModel> updatedUsers = List.from(users);
      updatedUsers[event.userIndex] = updatedUser;
      // added missing information of user that does not changed
      updatedUsers[event.userIndex].createdAt = event.createdAt;
      updatedUsers[event.userIndex].id = event.userId;
      emit(UserUpdated(users: updatedUsers));
    });

    on<DeleteDoctor>((event, emit) async {
      // deletes user doctor.
      emit(const LoadingState());
      await userRepo.deleteUser(event.userId);
      users.removeAt(event.index);
      Fluttertoast.showToast(msg: 'deleted successfully');
      emit(UserUpdated(users: users));
    });
  }
}
