import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';
import 'package:skill_guru/widget/base_layout.dart';
import 'package:skill_guru/widget/custom_button.dart';

class QuizzPage extends StatelessWidget {
  final String avatarPath;
  final String username;

  QuizzPage({required this.avatarPath, required this.username});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Résumé", // Titre de l'AppBar pour cette page
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrer verticalement
          children: [
            // Avatar sélectionné
            ClipOval(
              child: Image.asset(
                avatarPath,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            
            // Afficher le pseudo de l'utilisateur
            Text(
              username, // Pseudo de l'utilisateur
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConstants.primaryColor,
              ),
            ),
            SizedBox(height: 40),
            
            // Bouton pour démarrer le quizz
            CustomButton(
              text: 'Commencer le Quiz', // Texte du bouton
              onPressed: () {
                // Action à effectuer lorsqu'on appuie sur le bouton
                //Navigator.pushNamed(context, '/quizPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
