import 'package:go_router/go_router.dart';
import 'package:kiru/favorites/favorites.dart';
import 'package:kiru/features/auth/presentation/ui/auth_screen.dart';
import 'package:kiru/features/splash/presentation/ui/splash_screen.dart';
import 'package:kiru/home/home_screen.dart';
import 'package:kiru/login/login_screen.dart';
import 'package:kiru/recomendations/recomendations.dart';
import 'package:kiru/features/register/presentation/ui/register.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
    GoRoute(path: '/favorites', builder: (context, state) => FavoritesScreen()),
    GoRoute(
      path: '/recommendations',
      builder: (context, state) => RecommendationsScreen(),
    ),
  ],
);
