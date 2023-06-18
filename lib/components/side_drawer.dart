// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.brown[300],
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset('lib/assets/choco-tea.png'),
              arrowColor: Colors.black,
              accountName: Text('Jayneel Kanungo'),
              accountEmail: Text('kanungojayneel@gmail.com')),
          ListBody(
            children: [
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("Shop"),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart_outlined),
                title: Text("Shop"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                ),
                title: Text("Logout")),
          )
        ],
      ),
    );
  }
}
