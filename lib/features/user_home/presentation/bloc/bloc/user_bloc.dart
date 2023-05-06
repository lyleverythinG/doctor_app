import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as developer;
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  List<UserModel> users = [];
  UserBloc({required this.userRepo}) : super(UserInitial()) {
    on<CreateUserDoctor>((event, emit) async {
      // adds user
      try {
        emit(const LoadingState());
        final userDoctor = await userRepo.addDoctor(
            doctorName: event.doctorName,
            type: event.doctorType,
            yearsOfExp: event.yearsOfExperience);

        // inserts the newly added user to the first on the list.
        users.insert(0, userDoctor);
        emit(UserUpdated(users: users));
      } catch (e) {
        developer.log('Error adding doctor: $e', name: 'AddingDoctor');
      }
    });
    on<UpdateDoctorInfo>((event, emit) async {
      // updates user info
      try {
        emit(const LoadingState());
        final updatedUser = await userRepo.updateDoctorInfo(
          index: event.userIndex,
          userId: event.userId,
          doctorName: event.doctorName,
          type: event.doctorType,
          yearsOfExp: event.yearsOfExp,
        );
        List<UserModel> updatedUsers = List.from(users);
        updatedUsers[event.userIndex] = updatedUser;
        // added missing values that are not part of response.
        updatedUsers[event.userIndex].createdAt = event.createdAt;
        updatedUsers[event.userIndex].id = event.userId;
        updatedUsers[event.userIndex].isFavorite = event.isFavorite;
        emit(UserUpdated(users: updatedUsers));
      } catch (e) {
        developer.log('Error updating doctor Info: $e',
            name: 'UpdatingDoctorInfo');
      }
    });

    on<DeleteDoctor>((event, emit) async {
      // deletes user doctor.
      try {
        emit(const LoadingState());
        await userRepo.deleteUser(event.userId);
        users.removeAt(event.index);
        Fluttertoast.showToast(msg: 'deleted successfully');
        emit(UserUpdated(users: users));
      } catch (e) {
        developer.log('Error deleting doctor: $e', name: 'DeletingUserDoctor');
      }
    });

    on<AddDoctorToFavorites>((event, emit) async {
      // add a particular doctor to favorites.
      try {
        emit(const LoadingState());
        final updatedUser = await userRepo.addDoctorToFavorite(
          userId: event.user.id!,
        );
        users[event.userIndex].isFavorite = updatedUser.isFavorite;
        Fluttertoast.showToast(msg: 'Added to favorites');
        emit(UserUpdated(users: users));
      } catch (e) {
        developer.log('Error adding doctor to favorites: $e',
            name: 'ErrorAddingDoctorToFavorite');
      }
    });

    on<RemoveDoctorFromFavorites>((event, emit) async {
      // remove a particular doctor from favorites list.
      try {
        emit(const LoadingState());
        final updatedUser =
            await userRepo.removeDoctorFromFavorite(userId: event.user.id!);
        users[event.userIndex].isFavorite = updatedUser.isFavorite;
        Fluttertoast.showToast(msg: 'Removed from favorites');
        emit(UserUpdated(users: users));
      } catch (e) {
        developer.log('Error removing doctor from favorites: $e',
            name: 'ErrorRemovingDoctorFromFavorites');
      }
    });
  }
}
