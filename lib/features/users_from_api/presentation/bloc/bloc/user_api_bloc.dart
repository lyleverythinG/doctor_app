import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:doctor_app/features/users_from_api/domain/users_api_model.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as developer;
import 'package:hive/hive.dart';
part 'user_api_event.dart';
part 'user_api_state.dart';

class UserApiBloc extends Bloc<UserApiEvent, UserApiState> {
  final UserRepo userRepo;
  final reqresUsersBox = Hive.box<UserApiModel>('reqresUsers');
  UserApiBloc({required this.userRepo}) : super(UserApiInitial()) {
    on<UserApiEvent>((event, emit) async {
      try {
        // If the current state is already UserResults, we don't need to do anything.
        if (state is UserResults) return;

        // Gets the list of users from the API if the box is empty, else retrieve and assign it.
        final List<UserApiModel> users = reqresUsersBox.isEmpty
            ? await userRepo.getUsers()
            : reqresUsersBox.values.toList();

        // Adds the list of users to the box if it's empty.
        if (reqresUsersBox.isEmpty) await reqresUsersBox.addAll(users);

        // Emits the list of users to the state.
        emit(UserResults(usersFromApi: users));
      } catch (e) {
        developer.log('Error Fetching users from api Bloc: $e',
            name: 'ErrorFetchingApiInBloc');
      }
    });
  }
}
