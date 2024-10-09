import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiDisplay extends StatefulWidget {
  final ConfettiController controller;

  ConfettiDisplay({required this.controller});

  @override
  _ConfettiDisplayState createState() => _ConfettiDisplayState();
}

class _ConfettiDisplayState extends State<ConfettiDisplay> {
  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: widget.controller,
        blastDirectionality: BlastDirectionality.explosive,
        shouldLoop: false,
        numberOfParticles: 100,
        emissionFrequency: 0.1,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ],
        createParticlePath: drawStar, // Custom star path
      ),
    );
  }
}
