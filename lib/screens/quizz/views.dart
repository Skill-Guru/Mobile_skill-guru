import 'package:flutter/material.dart';
import 'package:skill_guru/screens/quizz/quiz_model.dart';

import 'quiz_service.dart'; // Pour récupérer les données du quiz
import 'quiz_widget.dart'; // Pour les widgets personnalisés

class StartQuizz extends StatefulWidget {
  final String result;

  StartQuizz({required this.result});

  @override
  _StartQuizzState createState() => _StartQuizzState();
}

class _StartQuizzState extends State<StartQuizz> {
  List<Quiz> quizzes = [];
  String selectedOption = '';
  int currentQuestionIndex = 0; // Ajoute une variable pour suivre la question actuelle

  @override
  void initState() {
    super.initState();
    _fetchQuizData(); // Appel pour récupérer les données
  }

  Future<void> _fetchQuizData() async {
    final quizData = await QuizService().fetchQuizData();
    setState(() {
      quizzes = quizData;
    });
  }

  void _onOptionSelected(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  // Fonction pour passer à la question suivante
  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < quizzes[0].questions.length - 1) {
        currentQuestionIndex++; // Incrémente l'index pour la question suivante
        selectedOption = ''; // Réinitialise la réponse sélectionnée
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Quiz terminé !')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Début du quizz'),
      ),
      body: quizzes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: QuizWidget(
                result: widget.result,
                quizzes: quizzes,
                selectedOption: selectedOption,
                currentQuestionIndex: currentQuestionIndex, // Passer l'index courant
                onOptionSelected: _onOptionSelected,
                onValidate: _nextQuestion, // Appelle _nextQuestion quand une réponse est validée
              ),
            ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: StartQuizz(result: 'Aucun résultat'),
  ));
}
