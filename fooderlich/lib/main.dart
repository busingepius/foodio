import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import "package:provider/provider.dart"; 

import 'fooderlich_theme.dart';

import 'navigation/app_router.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({super.key});

  @override
  State<Fooderlich> createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();
  // TODO: Define AppRouter

  late final _appRouter = AppRouter(
    // widget.appStateManager,
    _appStateManager,
    _profileManager,
    _groceryManager,
  );
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        // TODO: Add AppStateManager ChangeNotifierProvider
      ],
      child: Consumer<ProfileManager>(
        builder: (
          context,
          profileManager,
          Widget? child,
        ) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FooderlichTheme.dark();
          } else {
            theme = FooderlichTheme.light();
          }
          final router = _appRouter.router;
          return MaterialApp.router(
            theme: theme,
            title: 'Fooderlich',
            routerDelegate: router.routerDelegate,      
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
