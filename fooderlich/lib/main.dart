import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'screens.dart/screens.dart';

// TODO: Import app_router

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
  // TODO: Create AppStateManager
  // TODO: Define AppRouter

  // TODO: Initialize app router
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
          return MaterialApp(
            theme: theme,
            title: 'Fooderlich',
            // TODO: Replace with Router widget
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
