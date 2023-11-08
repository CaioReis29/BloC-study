import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserLogin>(
      (event, emit) {
        emit(
          UserLoggedIn(
            userId: event.userId,
            userName: event.userName,
          ),
        );
      },
    );
  }
}
