import 'package:flutter/material.dart';
import './screens/home_screen.dart'; // Assure-toi d'importer ton fichier home_screen.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations et gestes utilisateur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Charge l'interface principale
    );
  }
}
