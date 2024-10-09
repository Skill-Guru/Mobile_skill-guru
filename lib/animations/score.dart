import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';

class ScoreAnimationWidget extends StatelessWidget {
  final int score; // Le score à animer

  const ScoreAnimationWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: score), // Animation du score de 0 au score final
      duration: Duration(seconds: 2), // Durée de l'animation
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Votre score :',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '$value points',
              style: TextStyle(
                fontSize: 48, 
                fontWeight: FontWeight.bold,
                color: ColorConstants.accentuationColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
