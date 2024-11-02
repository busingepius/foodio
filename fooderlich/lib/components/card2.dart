import 'package:flutter/material.dart';

import '../fooderlich_theme.dart';
import '../models/models.dart';
import 'components.dart';

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card2({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
        child: Column(
          children: [
            AuthorCard(
              authorName: recipe.authorName,
              title: recipe.role,
              imageProvider: AssetImage(recipe.profileImage),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: Text(
                      recipe.title,
                      style: FooderlichTheme.lightTextTheme.headlineLarge,
                    ),
                  ),
                  Positioned(
                    bottom:70.0,
                    left:16.0,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        recipe.subtitle,
                        style: FooderlichTheme.lightTextTheme.headlineLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
