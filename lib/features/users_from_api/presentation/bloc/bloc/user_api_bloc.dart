import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:doctor_app/features/users_from_api/domain/users_api_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
part 'user_api_event.dart';
part 'user_api_state.dart';

class UserApiBloc extends Bloc<UserApiEvent, UserApiState> {
  final UserRepo userRepo;
  UserApiBloc({required this.userRepo}) : super(UserApiInitial()) {
    on<UserApiEvent>((event, emit) async {
      // only fetched the users from the api once.
      try {
        if (state is UserResults == false) {
          debugPrint('fetched users!');
          final List<UserApiModel> users = await userRepo.getUsers();
          emit(UserResults(usersFromApi: users));
        }
      } catch (e) {
        developer.log('Error Fetching users from api Bloc: $e',
            name: 'ErrorFetchingApiInBloc');
      }
    });
  }
}
