import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';
import 'package:skill_guru/models/quiz_model.dart';
import 'package:skill_guru/widget/custom_button.dart';
import 'package:skill_guru/widget/timer.dart';

class QuizWidget extends StatelessWidget {
  final String result;
  final List<Quiz> quizzes;
  final String selectedOption;
  final int currentQuestionIndex; // Index de la question actuelle
  final Function(String) onOptionSelected;
  final VoidCallback onValidate; // Callback pour valider la réponse
  final VoidCallback onTimeUp; // Callback quand le temps est écoulé

  QuizWidget({
    required this.result,
    required this.quizzes,
    required this.selectedOption,
    required this.currentQuestionIndex,
    required this.onOptionSelected,
    required this.onValidate,
    required this.onTimeUp,
  });

  @override
  Widget build(BuildContext context) {
    // Calculer la progression en fonction de l'index de la question actuelle
    double progress = (currentQuestionIndex) / quizzes[0].questions.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        // Barre de progression
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: LinearProgressIndicator(
            value: progress, // Affiche la progression
            backgroundColor: Colors.grey.shade300, // Couleur d'arrière-plan
            color: ColorConstants.primaryColor, // Couleur de progression
            minHeight: 8.0, // Hauteur de la barre
          ),
        ),
        SizedBox(height: 20), // Espacement sous la barre de progression

        // Timer widget
        TimerWidget(
          initialTime: quizzes[0].totalTimer,
          onTimeUp: onTimeUp, // Que faire quand le temps est écoulé
        ),
        SizedBox(height: 20),

        // Afficher la question en fonction de l'index courant
        Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Aligne le texte et le trait à gauche
          children: [
            Text(
              'QUESTION ${currentQuestionIndex + 1} :', // Affiche l'index de la question actuelle
              style: TextStyle(
                fontSize: 18,
                color: ColorConstants.secondaryColor, // Couleur du texte
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0), // Espace entre le texte et le trait
            Divider(
              color: ColorConstants.primaryColor, // Couleur du trait
              thickness: 2.0, // Épaisseur du trait
              endIndent: 20.0, // Décalage à droite du trait si tu veux un trait plus court
            ),
          ],
        ),
        Text(
          '${quizzes[0].questions[currentQuestionIndex].question}',
          style: TextStyle(fontSize: 18),
        ),

        SizedBox(height: 20),

        // Affichage des options de réponses
        ...quizzes[0].questions[currentQuestionIndex].options.map<Widget>((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), // Espace vertical entre les boutons
            child: SizedBox(
              width: double.infinity, // Prend toute la largeur
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: selectedOption == option
                      ? ColorConstants.accentuationColor
                      : ColorConstants.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15.0), // Padding vertical du bouton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bordures arrondies
                  ),
                ),
                onPressed: () {
                  onOptionSelected(option); // Gère la sélection d'une option
                },
                child: Text(
                  option,
                  style: TextStyle(
                    color: Colors.white, // Couleur du texte
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),

        SizedBox(height: 20),

        CustomButton(
          text: 'Valider la réponse',
          textColor: Colors.white,
          onPressed: () {
            if (!selectedOption.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Veuillez sélectionner une réponse.')),
              );
            } else {
              onValidate();
            }
          },
        ),
      ],
    );
  }
}
