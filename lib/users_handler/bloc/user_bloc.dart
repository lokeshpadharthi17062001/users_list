import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  static final _client = UserBloc._internal();

  factory UserBloc() {
    return _client;
  }

  static UserBloc get instance => _client;

  UserBloc._internal() : super(UserInitialState()) {
    on<UserViewEvent>((event, emit) async {
      emit(UserViewState());
    });
    on<UserContentViewEvent>((event, emit) async {
      emit(UserContentViewState(id: event.id));
    });
  }
}
