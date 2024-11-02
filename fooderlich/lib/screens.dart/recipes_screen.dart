import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';

import '../api/services.dart';
import '../models/models.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  RecipesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RecipesGridView(recipes: snapshot.data ?? []);
          } else {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }
        });
  }
}
