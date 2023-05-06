part of 'user_api_bloc.dart';

abstract class UserApiEvent extends Equatable {
  const UserApiEvent();
}

class FetchUsersFromApi extends UserApiEvent {
  const FetchUsersFromApi();
  @override
  List<Object> get props => [];
}
