import 'package:flutter/material.dart';
import 'package:skill_guru/screens/avatar/avatar_selection.dart';
import 'package:skill_guru/screens/home_screen.dart';
import 'package:skill_guru/widget/base_layout.dart';

class NameSelect extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController(); // Contrôleur pour obtenir le nom de l'utilisateur

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Sélection de pseudo', // Titre de l'AppBar
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Votre pseudo',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AvatarSelectionScreen(
                      userName: _nameController.text, // Passer le nom ici
                    ),
                  ),
                );
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
