import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/domain/domain.dart';
import 'package:setiket/src/features/common/presentation/checkout/checkout_page.dart';
import 'package:setiket/src/features/common/presentation/home/home_botnavbar_page.dart';
import 'package:setiket/src/features/common/presentation/search/search_page.dart';
import 'package:setiket/src/features/common/presentation/splash/splash_page.dart';
import 'package:setiket/src/features/jailbreak/presentation/jailbreak_page.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/routes/routes.dart';

enum Routes {
  splash,
  jailbreak,
  login,
  search,
  register,
  home,
  eventDetail,
  checkout,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      routerNeglect: true,
      redirectLimit: 1,
      routes: [
        GoRoute(
          path: '/splash',
          name: Routes.splash.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/jailbreak',
          name: Routes.jailbreak.name,
          builder: (context, state) => const JailbreakPage(),
        ),
        GoRoute(
          path: '/home',
          name: Routes.home.name,
          builder: (context, state) => const HomeBotNavBarScreen(),
          routes: const [],
        ),
        GoRoute(
          path: '/register',
          name: Routes.register.name,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/login',
          name: Routes.login.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/search',
          name: Routes.search.name,
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/event-detail',
          name: Routes.eventDetail.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final id = extras.datas[ExtrasKey.id] as int;
            return EventDetailPage(id: id);
          },
          routes: const [],
        ),
        GoRoute(
          path: '/checkout',
          name: Routes.checkout.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final ticket = extras.datas[ExtrasKey.ticket] as Ticket;
            return CheckoutPage(ticket: ticket);
          },
          routes: const [],
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);
