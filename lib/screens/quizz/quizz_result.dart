import 'package:flutter/material.dart';
import 'package:skill_guru/screens/home_screen.dart';
import 'package:skill_guru/widget/base_layout.dart';
import 'package:skill_guru/widget/custom_button.dart';
import 'package:skill_guru/animations/score.dart';

class QuizResult extends StatelessWidget {
  final int score; // Score total de l'utilisateur
  final String username;
  final String avatarPath; 

  QuizResult({required this.score, required this.username, required this.avatarPath});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Résultat du Quiz', // Titre de l'AppBar
      showBackButton: false,
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
            SizedBox(height: 20), // Espacement entre les textes
            ScoreAnimationWidget(score: score),
            SizedBox(height: 20),
            CustomButton(
              text: "Retour à la page d'accueil",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
