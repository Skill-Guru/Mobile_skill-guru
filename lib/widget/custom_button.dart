import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart'; // Assurez-vous d'importer vos constantes de couleurs

class CustomButton extends StatelessWidget {
  final String text; // Texte du bouton
  final VoidCallback onPressed; // Fonction appelée lors de l'appui sur le bouton
  final Color buttonColor; // Couleur de fond du bouton
  final Color textColor; // Couleur du texte

  // Constructeur du bouton réutilisable
  CustomButton({
    required this.text,
    required this.onPressed,
    this.buttonColor = ColorConstants.secondaryColor, // Couleur par défaut du bouton
    this.textColor = ColorConstants.primaryColor, // Couleur par défaut du texte
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Action à exécuter lors de l'appui
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, // Couleur de fond
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0), // Padding du bouton
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Bordures arrondies
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // Couleur du texte
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
