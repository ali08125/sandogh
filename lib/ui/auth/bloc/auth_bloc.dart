import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sandogh/data/repo/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthButtonClicked) {
        emit(AuthLoading());
        try {
          await authRepository.login(event.username, event.password);
          emit(AuthSuccess());
        } catch (e) {
          emit(AuthError());
        }
      }
    });
  }
}
