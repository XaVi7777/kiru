import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiru/features/app/presentation/bloc/auth/auth.dart';
import 'package:kiru/features/auth/presentation/bloc/auth_form.dart';
import 'package:kiru/widgets/app_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthFormBloc>(
        create: (context) => AuthFormBloc(),
        child: BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) {
            return current is AuthAuthenticatedState ||
                current is AuthUnauthenticatedState;
          },
          listener: (BuildContext context, AuthState state) {
            if (state is AuthAuthenticatedState) {
              context.replace('/home');
            } else if (state is AuthUnauthenticatedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 8,
                    left: 16,
                    right: 16,
                  ),
                  content: Text('Неверный логин или пароль'),
                ),
              );
            }
          },
          child: BlocBuilder<AuthFormBloc, AuthFormState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Form(
                  child: Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 80,
                        child: Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              onChanged: (value) =>
                                  context.read<AuthFormBloc>().add(
                                    AuthFormOnChangedEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  ),
                              decoration: InputDecoration(labelText: 'E-mail'),
                            ),
                            if (state is AuthFormInvalid)
                              Text(
                                state.emailError ?? '',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 80,
                        child: Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _passwordController,
                              onChanged: (value) =>
                                  context.read<AuthFormBloc>().add(
                                    AuthFormOnChangedEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  ),
                              decoration: InputDecoration(labelText: 'Пароль'),
                            ),
                            if (state is AuthFormInvalid)
                              Text(
                                state.passwordError ?? '',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return AppButton(
                            onTap: () {
                              context.read<AuthBloc>().add(
                                AuthLoginEvent(
                                  _emailController.text,
                                  _passwordController.text,
                                ),
                              );
                            },
                            text: 'Авторизоваться',
                            isLoading: state is AuthInitialState,
                            isDisabled:
                                state is AuthFormInvalid ||
                                state is AuthInitialState,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
