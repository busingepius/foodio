import 'package:flutter/material.dart';

import '../fooderlich_theme.dart';
import '../models/models.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card3({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  List<Widget> createTagChips() {
    final chips = <Widget>[];

    recipe.tags.take(6).forEach((element) {
      final chip = Chip(
        label: Text(element, style: FooderlichTheme.darkTextTheme.bodyLarge),
        backgroundColor: Colors.black.withOpacity(0.7),
      );
      chips.add(chip);
    });
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350.0,
          height: 450.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    recipe.title,
                    style: FooderlichTheme.darkTextTheme.headlineMedium,
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 12.0,
                runSpacing: 12.0,
                children: createTagChips(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
