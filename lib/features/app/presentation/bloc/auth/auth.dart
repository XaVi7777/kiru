import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/features/app/data/auth_repository.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthUnauthenticatedState extends AuthState {}

class AuthAuthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {}

abstract class AuthEvent {}

class AuthMeEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLoginEvent(this.email, this.password);
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  AuthRegisterEvent(this.email, this.password);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitialState()) {
    on<AuthMeEvent>(_onAuthMeEvent);
    on<AuthLoginEvent>(_onLoginEvent);
    on<AuthRegisterEvent>(_onRegisterEvent);
  }

  FutureOr<void> _onAuthMeEvent(
    AuthMeEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      if (state is! AuthInitialState) {
        emit(AuthInitialState());
      }
      final response = await authRepository.authMe();
      emit(response ? AuthAuthenticatedState() : AuthUnauthenticatedState());
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  FutureOr<void> _onLoginEvent(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      if (state is! AuthInitialState) {
        emit(AuthInitialState());
      }
      final response = await authRepository.login(event.email, event.password);
      emit(response ? AuthAuthenticatedState() : AuthUnauthenticatedState());
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  FutureOr<void> _onRegisterEvent(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      if (state is! AuthInitialState) {
        emit(AuthInitialState());
      }
      final response = await authRepository.registern(
        event.email,
        event.password,
      );
      emit(response ? AuthAuthenticatedState() : AuthUnauthenticatedState());
    } catch (e) {
      emit(AuthErrorState());
    }
  }
}
