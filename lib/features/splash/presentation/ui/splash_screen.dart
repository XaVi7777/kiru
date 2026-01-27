import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiru/core/widgets/app_data_error/app_data_error.dart';
import 'package:kiru/features/app/presentation/bloc/auth/auth.dart';
import 'package:kiru/widgets/svg_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _authMe(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          return current is AuthAuthenticatedState ||
              current is AuthUnauthenticatedState;
        },
        listener: (BuildContext context, AuthState state) {
          if (state is AuthAuthenticatedState) {
            context.replace('/home');
          } else if (state is AuthUnauthenticatedState) {
            context.replace('/login');
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) =>
              current is AuthInitialState || current is AuthErrorState,
          builder: (context, state) {
            if (state is AuthErrorState) {
              return AppDataError(onRepeat: () => _authMe(context));
            }
            return Center(child: SvgIcon.logo());
          },
        ),
      ),
    );
  }

  void _authMe(BuildContext context) =>
      context.read<AuthBloc>().add(AuthMeEvent());
}
