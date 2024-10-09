import 'package:flutter/material.dart';
import 'package:skill_guru/constants/color_constants.dart';
import 'package:skill_guru/screens/qrcode/scanner.dart';
import 'package:skill_guru/screens/quizz/views.dart';
import 'package:skill_guru/widget/base_layout.dart';
import 'package:skill_guru/widget/custom_button.dart';

class QuizScreen extends StatefulWidget {
  final String selectedAvatar;
  final String userName;

  const QuizScreen({
    required this.selectedAvatar,
    required this.userName,
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? _result;

  // Function to update the result of the quiz
  void setResult(String result) {
    setState(() {
      _result = result;
    });

    // If result is not null, navigate to the StartQuizz screen
    if (_result != null && _result!.isNotEmpty) {
      Future.microtask(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => StartQuizz(result: _result!, username: widget.userName, avatarPath: widget.selectedAvatar),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     // Si le résultat est déjà disponible, naviguer automatiquement vers StartQuizz
    if (_result != null) {
      Future.microtask(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => StartQuizz(result: _result!, username: widget.userName, avatarPath: widget.selectedAvatar),
          ),
        );
      });
    }
    
    return BaseLayout(
      title: "Résumé",
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected avatar
            ClipOval(
              child: Image.asset(
                widget.selectedAvatar,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Display the username of the user
            Text(
              widget.userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConstants.primaryColor,
              ),
            ),
            SizedBox(height: 40),

            // Display the scanned result if available
            Text(
              _result ?? 'No result',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Custom button to scan the QR code
            CustomButton(
              text: 'Scan QR code',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QrCodeScanner(setResult: setResult), // Start QR code scanner
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
