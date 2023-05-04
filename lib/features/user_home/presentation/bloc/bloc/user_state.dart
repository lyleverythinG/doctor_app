part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserUpdated extends UserState {
  final List<UserModel> users;

  const UserUpdated({required this.users});

  @override
  List<Object> get props => [users];
}
