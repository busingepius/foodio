import 'package:flutter/material.dart';

import 'screens.dart';

class Home extends StatefulWidget {
  // TODO: Home MaterialPage Helper

  final int currentTab;
  const Home({
    super.key,
    required this.currentTab,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = [
    ExploreScreen(),
    // RecipesScreen(),
    const GroceryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          profileButton(),
        ],
      ),
      body: IndexedStack(
        index: widget.currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: widget.currentTab,
        onTap: (index) {
          // TODO: Update user's selected tab
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To Buy',
          ),
        ],
      ),
    );
    // TODO: Add closing },);
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          // TODO: home -> profile
        },
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/person_stef.jpeg',
          ),
        ),
      ),
    );
  }
}
