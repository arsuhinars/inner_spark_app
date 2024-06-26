import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/views/main_view.dart';
import 'package:inner_spark_app/views/onboarding/login_view.dart';
import 'package:inner_spark_app/views/onboarding/signup_email_view.dart';
import 'package:inner_spark_app/views/onboarding/signup_profile_view.dart';
import 'package:inner_spark_app/views/onboarding/signup_view.dart';
import 'package:inner_spark_app/views/onboarding/startup_view.dart';
import 'package:inner_spark_app/views/user_profile_view.dart';
import 'package:inner_spark_app/views/workout_view.dart';

final onboardingRoutes = [
  GoRoute(
    path: '/startup',
    builder: (context, state) => const StartupView(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignupView(),
  ),
  GoRoute(
    path: '/signup/email',
    builder: (context, state) => const SignupEmailView(),
  ),
  GoRoute(
    path: '/signup/profile',
    builder: (context, state) => const SignupProfileView(),
  ),
];

final router = GoRouter(
  initialLocation: '/startup',
  routes: [
    ...onboardingRoutes,
    GoRoute(
      path: '/',
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const UserProfileView(),
    ),
    GoRoute(
      path: '/workout/:id',
      builder: (context, state) => const WorkoutView(),
    ),
  ],
);
