import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:skill_guru/widget/base_layout.dart';

import 'confetti_display.dart';
import 'quiz_details.dart';

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
      title: 'Résultat du Quiz',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ConfettiDisplay(controller: _controllerCenter), // Affichage des confettis
            QuizDetails(
              avatarPath: widget.avatarPath,
              username: widget.username,
              score: widget.score,
            ), // Affichage des détails du quiz
          ],
        ),
      ),
    );
  }
}
