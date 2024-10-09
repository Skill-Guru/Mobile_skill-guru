import 'package:flutter/material.dart';

class QuizDetails extends StatelessWidget {
  final String avatarPath;
  final String username;
  final int score;

  QuizDetails({required this.avatarPath, required this.username, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
