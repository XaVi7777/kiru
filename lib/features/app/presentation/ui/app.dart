import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/core/router/router.dart';
import 'package:kiru/features/app/data/auth_repository.dart';
import 'package:kiru/features/app/presentation/bloc/auth/auth.dart';

class KiruApp extends StatelessWidget {
  const KiruApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => AuthBloc(AuthRepository()),
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}