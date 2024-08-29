import 'package:flutter/material.dart';

import '../constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: const Text('Setting'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: customColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'images/profile.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                
                const SizedBox(width: 12.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daniell Zone',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '@danielloro',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.edit, color: Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          buildSettingsOption(Icons.security, 'Security'),
          buildSettingsOption(Icons.notifications, 'Notifications'),
          buildSettingsOption(Icons.perm_device_information, 'Device Permits'),
          buildSettingsOption(Icons.language, 'Language'),
          buildSettingsOption(Icons.history, 'History'),
          buildSettingsOption(Icons.help, 'Help And Support'),
          buildSettingsOption(Icons.brightness_6, 'White Mod', isSwitch: true),
          buildSettingsOption(Icons.delete, 'Delete'),
        ],
      ),
    );
  }

  Widget buildSettingsOption(IconData icon, String title, {bool isSwitch = false}) {
    return ListTile(
      leading: Icon(icon, color:customColor),
      title: Text(title),
      trailing: isSwitch
          ? Switch(
        value: false,
        onChanged: (val) {},
        activeColor: Colors.yellow,
      )
          : const Icon(Icons.arrow_forward, color:customColor),
      onTap: () {},
    );
  }
}