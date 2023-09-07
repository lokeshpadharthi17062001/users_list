part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserViewEvent extends UserEvent {
  const UserViewEvent();

  @override
  List<Object> get props => [];
}

class UserContentViewEvent extends UserEvent {
  final int id;
  const UserContentViewEvent({required this.id});

  @override
  List<Object> get props => [id];
}
