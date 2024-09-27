import 'package:flutter/material.dart';
import 'package:skill_guru/screens/avatar/avatar_selection.dart';
import 'package:skill_guru/screens/name_select/views.dart';
import 'package:skill_guru/widget/base_layout.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Accueil', // Titre de l'AppBar pour cette page
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Skill Guru!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NameSelect()),
                );
              },
              child: Text('Get Started'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AvatarSelectionScreen()),
            );
              },
              child: Text('Avatar'),
            ),
          ],
        ),
      );
  }
}


void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
