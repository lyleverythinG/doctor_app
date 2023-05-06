part of 'user_api_bloc.dart';

abstract class UserApiState extends Equatable {
  const UserApiState();

  @override
  List<Object> get props => [];
}

class UserApiInitial extends UserApiState {}

class UserResults extends UserApiState {
  final List<UserApiModel> usersFromApi;

  const UserResults({required this.usersFromApi});

  @override
  List<Object> get props => [usersFromApi];
}
