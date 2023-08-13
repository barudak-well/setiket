import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/starter/presentation/splash_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
  ],
);
