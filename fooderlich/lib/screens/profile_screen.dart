import 'package:flutter/material.dart';
import 'package:fooderlich/components/circle_image.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class ProfileScreen extends StatefulWidget {
  // TODO: ProfileScreen MaterialPage Helper

  final User user;
  final int currentTab;

  const ProfileScreen({
    super.key,
    required this.user,
    required this.currentTab,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.goNamed(
              'home',
              pathParameters: {
                'tab': '${widget.currentTab}',
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(),
            Expanded(child: buildMenu()),
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return ListView(
      children: [
        buildDarkModeRow(),
        ListTile(
          title: const Text('View raywenderlich.com'),
          onTap: () {
            context.goNamed(
              'rw',
              pathParameters: {
                'tab': '${widget.currentTab}',
              },
            );
          },
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        ),
      ],
    );
  }

  Widget buildDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: widget.user.darkMode,
            onChanged: (value) {
              Provider.of<ProfileManager>(context, listen: false).darkMode =
                  value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      children: [
        CircleImage(
          imageProvider: AssetImage(widget.user.profileImageUrl),
          imageRadius: 20.0,
        ),
        const SizedBox(height: 16.0),
        Text(widget.user.firstName, style: const TextStyle(fontSize: 21.0)),
        Text(widget.user.role),
        Text(
          '${widget.user.points} points',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
