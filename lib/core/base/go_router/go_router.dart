import 'package:firebase_auth_case/views/home/home_imports.dart';
import 'package:firebase_auth_case/views/sign_in/sign_in_imports.dart';
import 'package:firebase_auth_case/views/sign_up/sign_up_imports.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth_case/core/resources/my_routs/my_routs.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/${MyRouts.signIn}',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: MyRouts.signIn,
        path: '/${MyRouts.signIn}',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        name: MyRouts.signUp,
        path: '/${MyRouts.signUp}',
        builder: (context, state) => const SignUpView(),
      ),GoRoute(
        name: MyRouts.home,
        path: '/${MyRouts.home}',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return HomeView.fromRouteExtras(data);
        },
      ),
    ],
  );
}