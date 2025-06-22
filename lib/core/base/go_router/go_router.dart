import 'package:firebase_auth_case/views/home/home_imports.dart';
import 'package:firebase_auth_case/views/sign_in/sign_in_imports.dart';
import 'package:firebase_auth_case/views/sign_up/sign_up_imports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth_case/core/resources/my_routs/my_routs.dart';

import '../../models/user_profile_model.dart';

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
        pageBuilder: (context, state) {
          final data = state.extra as UserProfileModel;
          return MaterialPage(child: HomeView(user: data));
        },
      ),
    ],
  );
}