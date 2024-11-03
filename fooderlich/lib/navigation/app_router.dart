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
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) {
          return OnboardingScreen();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/:tab',
        builder: (BuildContext context, GoRouterState state) {
          final tab = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;
          return Home(
            key: state.pageKey,
            currentTab: tab,
          );
        },
        routes: [
          GoRoute(
              name: 'item',
              path: 'item/:id',
              builder: (BuildContext context, GoRouterState state) {
                final itemId =
                    int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
                groceryManager.groceryItemTapped(itemId);
                final GroceryItem? item = groceryManager.selectedGroceryItem;
                return GroceryItemScreen(
                  originalItem: item,
                  onCreate: (GroceryItem item) {
                    groceryManager.addItem(item);
                  },
                  onUpdate: (GroceryItem item, int index) {
                    groceryManager.updateItem(item, index);
                  },
                );
              }),
          // TODO: Add Profile Subroute
        ],
      ),
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
      final loggingIn = state.fullPath == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.fullPath == '/onboarding';
      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }

      if (loggedIn && onboarding) return '/${FooderlichTab.explore}';

      return null;
    },
  );
}
