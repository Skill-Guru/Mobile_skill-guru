import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final bool showBackButton;

  BaseLayout({required this.child, required this.title, this.showBackButton = true}); // Ajout d'un titre pour l'AppBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        centerTitle: true,
        title: Text(title),
        automaticallyImplyLeading: showBackButton,
      ),
      backgroundColor: ColorConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo.png', // Logo en haut de chaque page
                  height: 75, // Taille du logo
                  width: 75,  // Largeur du logo pour garder le cercle
                  fit: BoxFit.cover, // Assure que l'image remplit le cercle
                ),
              ),
            ),
            SizedBox(height: 20), // Espace entre le logo et le contenu
            Expanded(
              child: Center(
                child: child, // Contenu spécifique de chaque page centré
              ),
            ),
          ],
        ),
      ),
    );
  }
}
