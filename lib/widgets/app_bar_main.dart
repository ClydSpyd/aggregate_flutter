// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const Icon(Icons.menu),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print('Search button clicked');
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            print('Notification button clicked');
          },
        ),
      ],
    );
  }

  // This provides the default size for the AppBar.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
