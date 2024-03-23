import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/views/onboarding/login_view.dart';
import 'package:inner_spark_app/views/onboarding/signup_view.dart';
import 'package:inner_spark_app/views/onboarding/startup_view.dart';

final onboardingRoutes = [
  GoRoute(
    path: '/startup',
    builder: (context, state) => const StartupView()
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginView()
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignupView()
  ),
  // GoRoute(path: '/sign_up/email'),
  // GoRoute(path: '/sign_up/goal'),
  // GoRoute(path: '/sign_up/gender'),
  // GoRoute(path: '/sign_up/age'),
  // GoRoute(path: '/sign_up/fitness_level'),
  // GoRoute(path: '/sign_up/fitness_preference'),
];

final router = GoRouter(
  initialLocation: '/startup',
  routes: [
    ...onboardingRoutes
  ]
);
