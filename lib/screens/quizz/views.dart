import 'package:flutter/material.dart';
import 'package:skill_guru/models/quiz_model.dart';
import 'package:skill_guru/widget/base_layout.dart';
import 'package:skill_guru/services/quiz_service.dart';
import 'package:skill_guru/widget/quiz_widget.dart';
import 'package:skill_guru/screens/quizz/quizz_result.dart';

class StartQuizz extends StatefulWidget {
  final String result;
  final String username; 
  final String avatarPath;

  StartQuizz({required this.result, required this.username, required this.avatarPath});

  @override
  _StartQuizzState createState() => _StartQuizzState();
}

class _StartQuizzState extends State<StartQuizz> {
  List<Quiz> quizzes = [];
  String selectedOption = '';
  int currentQuestionIndex = 0;
  int score = 0;

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

  void _onTimeUp() {
    _nextQuestion();
  }

  // Fonction pour passer à la question suivante
  void _nextQuestion() {
    if (selectedOption == quizzes[0].questions[currentQuestionIndex].answer) {
      score += 100;
    }
 
    setState(() {
      if (currentQuestionIndex < quizzes[0].questions.length - 1) {
        currentQuestionIndex++; // Incrémente l'index pour la question suivante
        selectedOption = ''; // Réinitialise la réponse sélectionnée
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResult(score: score, username: widget.username, avatarPath: widget.avatarPath),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Début du quizz', // Utilisation du titre dynamique pour l'AppBar
      child: quizzes.isEmpty
          ? Center(child: CircularProgressIndicator()) // Loader si les données sont vides
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: QuizWidget(
                result: widget.result,
                quizzes: quizzes,
                selectedOption: selectedOption,
                currentQuestionIndex: currentQuestionIndex, // Passer l'index courant
                onOptionSelected: _onOptionSelected,
                onValidate: _nextQuestion, // Appelle _nextQuestion quand une réponse est validée,
                onTimeUp: _onTimeUp,
              ),
            ),
    );
  }
}
