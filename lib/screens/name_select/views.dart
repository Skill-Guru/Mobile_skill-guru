import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';
import 'package:skill_guru/screens/avatar/avatar_selection.dart';
import 'package:skill_guru/widget/base_layout.dart';
import 'package:skill_guru/widget/custom_button.dart';

class NameSelect extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController(); // Contrôleur pour obtenir le nom de l'utilisateur

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Sélection de pseudo', // Titre de l'AppBar
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: ColorConstants.primaryColor), // Couleur du label
                border: OutlineInputBorder(
                  borderSide: BorderSide(color : ColorConstants.primaryColor),
                ),
                labelText: 'Votre pseudo',
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Valider',
              onPressed: () {
                String userName = _nameController.text;
                
                // Validation : non vide et contient uniquement des lettres et des chiffres
                if (userName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Le pseudo ne peut pas être vide',
                        style: TextStyle(
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.w500,
                          ),
                      ),
                      backgroundColor: ColorConstants.accentuationColor,
                    ),
                  );
                } else if (!_isAlphanumeric(userName)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(
                      'Le pseudo doit contenir uniquement des lettres ou des chiffres',
                      style: TextStyle(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w500,),
                      ),
                      backgroundColor: ColorConstants.accentuationColor,
                    ),
                  );
                } else {
                  // Si tout est OK, naviguer vers la sélection d'avatar
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AvatarSelectionScreen(
                        userName: _nameController.text, // Passer le nom ici
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  // Fonction qui vérifie si une chaîne contient uniquement des lettres et des chiffres
  bool _isAlphanumeric(String str) {
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumeric.hasMatch(str);
  }
}
