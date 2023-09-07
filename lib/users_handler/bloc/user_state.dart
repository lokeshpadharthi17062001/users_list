part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserViewState extends UserState {
  @override
  List<Object> get props => [];
}

class UserContentViewState extends UserState {
  final int id;
  const UserContentViewState({required this.id});
  @override
  List<Object> get props => [id];
}
