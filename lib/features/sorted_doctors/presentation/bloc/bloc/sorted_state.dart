part of 'sorted_bloc.dart';

abstract class SortedState extends Equatable {
  const SortedState();

  @override
  List<Object> get props => [];
}

class SortedInitial extends SortedState {}

class SortedUsersLoadingState extends SortedState {
  const SortedUsersLoadingState();

  @override
  List<Object> get props => [];
}

class SortedDoctorsResult extends SortedState {
  final List<UserModel> sortedDoctors;
  const SortedDoctorsResult({required this.sortedDoctors});

  @override
  List<Object> get props => [sortedDoctors];
}

class EmptySortedResult extends SortedState {
  const EmptySortedResult();

  @override
  List<Object> get props => [];
}
