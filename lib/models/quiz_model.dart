class Quiz {
  final String id;
  final String title;
  final List<Question> questions;
  final int totalTimer;

  Quiz({
    required this.id, 
    required this.title, 
    required this.questions,
    required this.totalTimer
    });

  factory Quiz.fromJson(Map<String, dynamic> json) {

    int totalTimer = (json['questions'] as List)
    .fold(0, (total, question) => total + (question['timer'] as int));

    return Quiz(
      id: json['id'],
      title: json['title'],
      questions: (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
      totalTimer: totalTimer,
    );
    
  }
}

class Question {
  final String question;
  final List<String> options;
  final String answer;
  final int timer;
  Question({required this.question, required this.options, required this.answer, required this.timer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
      timer: json['timer'],
    );
  }
}

