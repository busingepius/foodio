import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'screens.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.goNamed(
              'item',
              pathParameters: {
                'tab': '${FooderlichTab.toBuy}',
                'id': 'new',
              },
            );
          }),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (
      BuildContext context,
      GroceryManager groceryManager,
      Widget? child,
    ) {
      if (groceryManager.groceryItems.isNotEmpty) {
        return GroceryListScreen(groceryManager: groceryManager);
      } else {
        return const EmptyGroceryScreen();
      }
    });
  }
}
