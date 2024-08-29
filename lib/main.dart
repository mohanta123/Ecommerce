import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottomNavigationBar.dart';
import 'constants.dart';
import 'pages/home.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appman Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: customColor, fontFamily: "Ubuntu"),
      home: const Login(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'home':
            return CupertinoPageRoute(
              builder: (_) => const ButtonNavigation(),
              settings: settings,
            );
        }
        return null;
      },
    );
  }
}
