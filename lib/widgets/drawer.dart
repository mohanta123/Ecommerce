import 'package:flutter/material.dart';

import '../constants.dart';
import 'fonts.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  static const String profileImage = 'https://openart.ai/community/nYPujtif03sfsMHmnHMg';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: customColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/profile.jpg"),
                  ),
                  SizedBox(height: 6),
                  // Name
                  Text(
                    'Ananya Patra',
                    style: TextFont.bold_TextStyle.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),

                  Text(
                    'ananyapatra@gmail.com',
                    style: TextFont.normal_TextStyle.copyWith(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home,color: Colors.white,),
            title: Text('Home',  style: TextFont.normal_TextStyle.copyWith(
              fontSize: 15,
              color: Colors.white70,
            ),),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.white,),
            title: Text('Settings', style: TextFont.normal_TextStyle.copyWith(
              fontSize: 15,
              color: Colors.white70,
            )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts,color: Colors.white,),
            title: Text('Contact Us', style: TextFont.normal_TextStyle.copyWith(
              fontSize: 15,
              color: Colors.white70,
            )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/contact');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.white,),
            title: Text('Logout', style: TextFont.normal_TextStyle.copyWith(
              fontSize: 15,
              color: Colors.white70,
            )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/login');
            },
          ),

        ],
      ),
    );
  }
}
