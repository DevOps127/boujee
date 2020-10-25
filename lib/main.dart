import 'package:boujee/ui/screens/connexion_screen.dart';
import 'package:boujee/ui/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boujee',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: ConnexionScreen(),
    );
  }
}

