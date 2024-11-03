import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;

  AppRouter(
    this.appStateManager,
    this.profileManager,
    this.groceryManager,
  );

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
          name: 'login',
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          }),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) {
          return OnboardingScreen();
        },
      ),
      // TODO: Add Home Route
    ],
    errorPageBuilder: (BuildContext context, GoRouterState state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),            
      );
    },
    redirect: (context, state) {
      final loggedIn = appStateManager.isLoggedIn;
      final loggingIn = state.name == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';
      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.name == '/onboarding';
      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }
      if (loggingIn || onboarding) return '${FooderlichTab.explore}';

      return null;
    },
  );
}
