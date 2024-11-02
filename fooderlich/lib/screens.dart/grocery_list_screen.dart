import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager groceryManager;

  const GroceryListScreen({
    super.key,
    required this.groceryManager,
  });

  @override
  Widget build(BuildContext context) {
    final groceryItems = groceryManager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = groceryItems[index];
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              groceryManager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.name} dismissed'),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    groceryManager.completeItem(index, change);
                  }
                },
              ),
              onTap: () {
                // TODO: Tap on grocery item
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
