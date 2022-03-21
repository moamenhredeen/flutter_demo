
import 'package:flutter/material.dart';

class PDrawer extends StatelessWidget {
  const PDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEEE),
            ),
            child: Center(child: Text('pSM Client Prototype', style: TextStyle(fontSize: 24),)),
          ),
          ListTile(
            title: const Text('Home Page'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: const Text('TodoList'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/todolist');
            },
          ),
          ListTile(
            title: const Text('Graphics'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/graphics');
            },
          ),
        ],
      ),
    );
  }
}
