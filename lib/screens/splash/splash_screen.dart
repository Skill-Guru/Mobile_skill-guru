import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';
import 'package:skill_guru/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Configurer l'animation avec une durée totale de 2.5 secondes
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4, milliseconds: 500), // Durée totale de 2.5 secondes
    );

    // Scale animation (première partie, 1.25 seconde)
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeInOut), // 50% du temps = 1.25s
    );

    // Slide animation (deuxième partie, 1.25 seconde)
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0), // Le logo glisse vers la droite
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.elasticIn), // 50% du temps = 1.25s
      ),
    );

    // Lancer l'animation
    _controller.forward();

    // Naviguer vers HomeScreen après 2.5 secondes
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor, // Même couleur que ton splash
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Image.asset(
              'assets/images/logo.png', // Ton logo
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
