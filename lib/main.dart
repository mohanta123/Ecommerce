import 'package:appman_ecommerce/pages/loginPage.dart';
import 'package:appman_ecommerce/pages/signupPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottomNavigationBar.dart';
import 'constants.dart';

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
              builder: (_) => const LoginPage(),
              settings: settings,
            );
        }
        return null;
      },
    );
  }
}
