import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/core/reg_exps.dart';

abstract class RegFormState {}

class RegFormValidState extends RegFormState {}

class RegFormInvalidState extends RegFormState {
  final String? emailError;
  final String? passwordError;
  final String? repeatPasswordError;

  RegFormInvalidState({
    this.emailError,
    this.passwordError,
    this.repeatPasswordError,
  });
}

abstract class RegFormEvent {}

class RegFormChangedEvent extends RegFormEvent {
  final String email;
  final String password;
  final String repeatPassword;

  RegFormChangedEvent({
    required this.email,
    required this.password,
    required this.repeatPassword,
  });
}

class RegFormBloc extends Bloc<RegFormEvent, RegFormState> {
  RegFormBloc() : super(RegFormInvalidState()) {
    on<RegFormChangedEvent>(_onFormChanged);
  }

  FutureOr<void> _onFormChanged(
    RegFormChangedEvent event,
    Emitter<RegFormState> emit,
  ) {
    String? emailError;
    String? passwordError;
    String? repeatPasswordError;
    if (event.email.isEmpty) {
      emailError = 'Поле обязательно для заполнения';
    } else if(!RegExps.emailRegex.hasMatch(event.email)){
      emailError = 'E-mail невалидный';
    }

    if (event.password.isEmpty) {
      passwordError = 'Поле обязательно для заполнения';
    }

    if (event.repeatPassword.isEmpty) {
      repeatPasswordError = 'Поле обязательно для заполнения';
    } else if (event.password != event.repeatPassword) {
      repeatPasswordError = 'Пароли должны совпадать';
    }

    if (emailError != null ||
        passwordError != null ||
        repeatPasswordError != null) {
      emit(
        RegFormInvalidState(
          emailError: emailError,
          passwordError: passwordError,
          repeatPasswordError: repeatPasswordError,
        ),
      );
    } else {
      emit(RegFormValidState());
    }
  }
}
