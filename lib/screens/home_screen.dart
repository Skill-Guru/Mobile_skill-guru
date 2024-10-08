import 'package:flutter/material.dart';
import 'package:skill_guru/screens/qrcode/scanner.dart';
import 'package:skill_guru/screens/quizz/views.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _result;

  void setResult(String result) {
    setState(() => _result = result);
  }

  @override
  Widget build(BuildContext context) {

    // Si le résultat est déjà disponible, naviguer automatiquement vers StartQuizz
    if (_result != null) {
      Future.microtask(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => StartQuizz(result: _result!),
          ),
        );
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_result ?? 'No result'),
            ElevatedButton(
              child: const Text('Scan QR code'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QrCodeScanner(setResult: setResult),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
