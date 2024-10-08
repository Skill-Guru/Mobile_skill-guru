import 'package:flutter/material.dart';

import 'quiz_model.dart';

class QuizWidget extends StatelessWidget {
  final String result;
  final List<Quiz> quizzes;
  final String selectedOption;
  final int currentQuestionIndex; // Ajouter un paramètre pour l'index de la question actuelle
  final Function(String) onOptionSelected;
  final VoidCallback onValidate; // Ajoute un callback pour valider la réponse

  QuizWidget({
    required this.result,
    required this.quizzes,
    required this.selectedOption,
    required this.currentQuestionIndex,
    required this.onOptionSelected,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Résultat du scan : $result'),

        SizedBox(height: 20),

        // Afficher la question en fonction de l'index courant
        Text(
          quizzes[0].questions[currentQuestionIndex].question,
          style: TextStyle(fontSize: 18),
        ),

        SizedBox(height: 20),

        // Affichage des options de réponses
        ...quizzes[0].questions[currentQuestionIndex].options.map<Widget>((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedOption,
            onChanged: (String? value) {
              onOptionSelected(value!); // Gère la sélection d'une option
            },
          );
        }).toList(),

        SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {
            if (selectedOption.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Réponse sélectionnée : $selectedOption')),
              );
              onValidate(); // Passe à la question suivante
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Veuillez sélectionner une réponse.')),
              );
            }
          },
          child: Text('Valider la réponse'),
        ),
      ],
    );
  }
}
