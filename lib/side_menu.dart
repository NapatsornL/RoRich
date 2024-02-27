// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'image ja p',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.pink[100],
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/images/cover.jpg'),
              // ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.currency_exchange_rounded),
            title: Text('RoRich Converter'),
            onTap: () => {
              Navigator.pushNamed(context, '/convert_main'),
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_outlined),
            title: Text('RoRichChat'),
            onTap: () => {
              Navigator.pushNamed(context, '/chat'),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Profile'),
            onTap: () => {
              Navigator.pushNamed(context, '/profile_setting'),
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign out'),
            onTap: () => {
              Navigator.pushNamed(context, '/login'),
            },
          ),
        ],
      ),
    );
  }
}
