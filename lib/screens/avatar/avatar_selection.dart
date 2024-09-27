import 'package:flutter/material.dart';
import 'package:skill_guru/widget/base_layout.dart';
import 'package:skill_guru/constants/color_constants.dart';

class AvatarSelectionScreen extends StatefulWidget {
  @override
  _AvatarSelectionScreenState createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  String selectedAvatar = 'assets/images/1.jpg'; // Avatar par défaut

  // Liste des avatars disponibles
  List<String> avatarList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Sélection de l'avatar", // Titre de l'AppBar pour cette page
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Liste d'avatars à sélectionner
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: avatarList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatar = avatarList[index]; // Mettre à jour l'avatar sélectionné
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedAvatar == avatarList[index]
                              ? ColorConstants.accentuationColor // Si cet avatar est sélectionné, la bordure est bleue
                              : ColorConstants.backgroundColor, // Sinon, elle est grise
                          width: 3,
                        ),
                      ),
                      child: Image.asset(avatarList[index]), // Affichage de l'avatar
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Avatar sélectionné affiché en bas de l'écran
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Votre Avatar :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(selectedAvatar), // Affichage de l'avatar sélectionné
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
