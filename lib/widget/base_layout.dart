import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';


class BaseLayout extends StatelessWidget {
  final Widget child;
  final String title;

  BaseLayout({required this.child, required this.title}); // Ajout d'un titre pour l'AppBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ajout de l'AppBar
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor, // Couleur de l'AppBar
        title: Text(title), // Titre de la page (dynamique)
      ),
      backgroundColor: ColorConstants.backgroundColor, // Couleur de fond de la page
      body: Padding(
        padding: const EdgeInsets.all(30.0), // Padding de 30
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: child, // Contenu spécifique de chaque page
            ),
          ],
        ),
      ),
    );
  }
}
