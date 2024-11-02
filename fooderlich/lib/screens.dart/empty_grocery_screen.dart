import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/fooderlich_assets/empty_list.png'),
              ),
            ),
            Text(
              'No Groceries',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              shape: const StadiumBorder(
                side: BorderSide(style: BorderStyle.solid),
              ),
              color: Colors.green,
              onPressed: () {
                //TODO: Update user's selected tab
              },
              child: const Text('Browse Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}
