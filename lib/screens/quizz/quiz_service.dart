import 'dart:convert'; // Pour le décodage JSON
import 'dart:io'; // Pour les requêtes réseau

import 'quiz_model.dart';

class QuizService {
  Future<List<Quiz>> fetchQuizData() async {
    try {
      final url = Uri.parse('https://eukrasia.fr/wp-content/uploads/2024/10/quizzes.json');
      final HttpClient client = HttpClient();
      final HttpClientRequest request = await client.getUrl(url); // Créer la requête
      final HttpClientResponse response = await request.close(); // Envoyer la requête et attendre la réponse

      if (response.statusCode == 200) {
        final String responseBody = await response.transform(utf8.decoder).join();
        List<dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse.map((data) => Quiz.fromJson(data)).toList(); // Retourne List<Quiz>
      } else {
        throw Exception('Failed to load quiz');
      }
    } catch (e) {
      print('Erreur lors du chargement du quiz: $e');
      return [];
    }
  }
}
