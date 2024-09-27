import 'package:flutter/material.dart';

class ContainerVisibilityManager extends StatefulWidget {
  @override
  _ContainerVisibilityManagerState createState() =>
      _ContainerVisibilityManagerState();
}

class _ContainerVisibilityManagerState
    extends State<ContainerVisibilityManager> with SingleTickerProviderStateMixin {
  bool _isVisible = true;
  double _opacity = 1.0;
  bool _moveRight = false; // Variable pour gérer le déplacement

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialisation de l'AnimationController pour une durée de 500 ms
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true); // Répétition infinie avec aller-retour

    // Définir l'animation avec un effet de rebond (Curves.bounceInOut)
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.5 : 1.0;
      _moveRight = !_moveRight; // Bascule le déplacement à droite ou gauche
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isVisible)
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 50), // Modifie les marges
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: Text(_isVisible ? 'Masquer' : 'Afficher'),
            ),
            if (_isVisible)
              ElevatedButton(
                onPressed: _toggleOpacity,
                child: Text(_opacity == 1.0 ? 'Opacité à 50%' : 'Opacité à 100%'),
              ),
            SizedBox(height: 50),
            // Logo animé avec ScaleTransition
            ScaleTransition(
              scale: _animation, // Utilisation de l'animation pour la mise à l'échelle
              child: const FlutterLogo(size: 150.0),
            ),
          ],
        ),
        // Conteneur vert animé avec AnimatedPositioned
          Positioned(
            bottom: 50, // Positionné juste au-dessus du bas
            left: 0,
            right: 0,
            child: AnimatedPositioned(
              duration: Duration(seconds: 1), // Durée du mouvement
              left: _moveRight ? MediaQuery.of(context).size.width - 100 : 0, // Change la position
              curve: Curves.easeInOut, // Animation fluide
              child: Container(
                width: 100,
                height: 50,
                color: Colors.green,
              ),
            ),
          ),
      ],
    );
  }
}
