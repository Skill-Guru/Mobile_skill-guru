import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:skill_guru/animations/score.dart';
import 'package:skill_guru/screens/home_screen.dart';
import 'package:skill_guru/widget/base_layout.dart';
import 'package:skill_guru/widget/custom_button.dart';

import 'confetti_display.dart';

class QuizResult extends StatefulWidget {
  final int score;
  final String username;
  final String avatarPath;

  QuizResult({required this.score, required this.username, required this.avatarPath});

  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    
    // Initialiser le contrôleur de confettis
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();

    // Arrêter les confettis après 10 secondes
    Future.delayed(const Duration(seconds: 10), () {
      _controllerCenter.stop();
    });
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Résultat du Quiz', // Titre de l'AppBar
      showBackButton: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ConfettiDisplay(controller: _controllerCenter),
            ClipOval(
              child: Image.asset(
                widget.avatarPath, // Chemin de l'image de l'avatar
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Espacement entre les textes
            ScoreAnimationWidget(score: widget.score),
            SizedBox(height: 20),
            CustomButton(
              text: "Retour à la page d'accueil",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
