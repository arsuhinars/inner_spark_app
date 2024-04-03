import 'package:go_router/go_router.dart';
import 'package:inner_spark_app/views/onboarding/login_view.dart';
import 'package:inner_spark_app/views/onboarding/signup_email_view.dart';
import 'package:inner_spark_app/views/onboarding/signup_profile_view.dart';
import 'package:inner_spark_app/views/onboarding/signup_view.dart';
import 'package:inner_spark_app/views/onboarding/startup_view.dart';

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

final mainRoutes = [
  GoRoute(path: '/home'),
  GoRoute(path: '/user/profile'),
  GoRoute(path: '/user/goals'),
  GoRoute(path: '/workouts'),
  GoRoute(path: '/workouts/:id'),
  GoRoute(path: '/meditations'),
  GoRoute(path: '/meditations/:id'),
  GoRoute(path: '/steps_hydration'),
  GoRoute(path: '/mood'),
  GoRoute(path: '/store'),
];

final router = GoRouter(
  initialLocation: '/startup',
  routes: [...onboardingRoutes],
);
