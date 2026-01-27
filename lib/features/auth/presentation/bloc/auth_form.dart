import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/core/reg_exps.dart';

abstract class AuthFormState {}

class AuthFormValid extends AuthFormState {}

class AuthFormInvalid extends AuthFormState {
  final String? emailError;
  final String? passwordError;

  AuthFormInvalid({this.emailError, this.passwordError});
}

abstract class AuthFormEvent {}

class AuthFormOnChangedEvent extends AuthFormEvent {
  final String email;
  final String password;

  AuthFormOnChangedEvent({required this.email, required this.password});
}

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  AuthFormBloc() : super(AuthFormInvalid()) {
    on<AuthFormOnChangedEvent>(_onChangedAuthFormEvent);
  }

  FutureOr<void> _onChangedAuthFormEvent(
    AuthFormOnChangedEvent event,
    Emitter<AuthFormState> emit,
  ) {
    final updatedState = _formValidation(
      email: event.email,
      password: event.password,
    );
    emit(updatedState);
  }

  AuthFormState _formValidation({
    required String email,
    required String password,
  }) {
    String? emailError;
    String? passwordError;

    if (email.isEmpty) {
      emailError = 'Поле не может быть пустым';
    } else if (!RegExps.emailRegex.hasMatch(email)) {
      emailError = 'Некорректный адрес';
    }
    if (password.isEmpty) {
      passwordError = 'Поле не может быть пустым';
    } else if (password.length < 4) {
      passwordError = 'Пароль должен быть минимум 4 символа';
    }

    if (passwordError != null || emailError != null) {
      return AuthFormInvalid(
        emailError: emailError,
        passwordError: passwordError,
      );
    }
    return AuthFormValid();
  }
}
