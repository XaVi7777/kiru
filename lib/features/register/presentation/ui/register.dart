import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiru/core/widgets/app_input/app_input.dart';
import 'package:kiru/features/app/presentation/bloc/auth/auth.dart';
import 'package:kiru/features/register/presentation/bloc/reg_form_bloc/reg_form_bloc.dart';
import 'package:kiru/widgets/app_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _repeatPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticatedState) {
              context.replace('/home');
            } else if (state is AuthUnauthenticatedState) {
              ScaffoldMessenger.of(context).showMaterialBanner(
                MaterialBanner(
                  content: Text('Что-то пошло не так'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).hideCurrentMaterialBanner();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          child: BlocProvider<RegFormBloc>(
            create: (BuildContext context) => RegFormBloc(),
            child: BlocBuilder<RegFormBloc, RegFormState>(
              builder: (context, state) {
                return Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ).copyWith(bottom: 32),
                    child: Column(
                      children: [
                        const Spacer(),
                        Column(
                          spacing: 12,
                          children: [
                            AppInput(
                              controller: _emailController,
                              labelText: 'E-mail',
                              onChanged: (value) =>
                                  _onInputChanged(context, value),
                              errorMessage: state is RegFormInvalidState
                                  ? state.emailError
                                  : null,
                            ),
                            AppInput(
                              controller: _passwordController,
                              labelText: 'Пароль',
                              onChanged: (value) =>
                                  _onInputChanged(context, value),
                              errorMessage: state is RegFormInvalidState
                                  ? state.passwordError
                                  : null,
                            ),
                            AppInput(
                              controller: _repeatPasswordController,
                              labelText: 'Повторите пароль',
                              onChanged: (value) =>
                                  _onInputChanged(context, value),
                              errorMessage: state is RegFormInvalidState
                                  ? state.repeatPasswordError
                                  : null,
                            ),
                          ],
                        ),
                        const Spacer(),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return AppButton(
                              onTap: () {
                                context.read<AuthBloc>().add(
                                  AuthRegisterEvent(
                                    _emailController.text,
                                    _passwordController.text,
                                  ),
                                );
                              },
                              text: 'Зарегистрироваться',
                              isLoading: state is AuthInitialState,
                              isDisabled: state is RegFormInvalidState,
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onInputChanged(BuildContext context, String value) {
    context.read<RegFormBloc>().add(
      RegFormChangedEvent(
        email: _emailController.text,
        password: _passwordController.text,
        repeatPassword: _repeatPasswordController.text,
      ),
    );
  }
}
