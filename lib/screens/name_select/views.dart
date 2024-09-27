import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';
import 'package:skill_guru/screens/home_screen.dart';

class NameSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor, // #401C48
      ),
      backgroundColor: ColorConstants.backgroundColor, // #401C48 avec 35 % d'opacité
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 100, // Vous pouvez ajuster la taille selon vos besoins
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Votre pseudo',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action à réaliser après la saisie du nom (par exemple, afficher un message ou revenir à l'écran précédent)
              },
              child: Text('Valider'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Border radius de 12px
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}