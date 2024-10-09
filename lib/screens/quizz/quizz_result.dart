import 'package:flutter/material.dart';
import 'package:skill_guru/widget/base_layout.dart';

class QuizResult extends StatelessWidget {
  final int score; // Score total de l'utilisateur
  final String username;
  final String avatarPath; 

  QuizResult({required this.score, required this.username, required this.avatarPath});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Résultat du Quiz', // Titre de l'AppBar
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrer verticalement le contenu
          crossAxisAlignment: CrossAxisAlignment.center, // Centrer horizontalement le contenu
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                avatarPath, // Chemin de l'image de l'avatar
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Votre score :',
              style: TextStyle(fontSize: 24), // Taille du texte pour "Votre score :"
            ),
            SizedBox(height: 20), // Espacement entre les textes
            Text(
              '$score points',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold, // Texte en gras pour le score
                color: Colors.blue, // Optionnel : tu peux remplacer par une couleur constante si tu en utilises une
              ),
            ),
          ],
        ),
      ),
    );
  }
}
