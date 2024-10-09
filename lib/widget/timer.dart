import 'dart:async';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final int initialTime;
  final VoidCallback onTimeUp;

  TimerWidget({required this.initialTime, required this.onTimeUp});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialTime;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel(); // Annule tout ancien timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          _timer?.cancel();
          widget.onTimeUp(); // Appelle la fonction lorsque le temps est écoulé
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Temps restant : $remainingTime secondes',
      style: TextStyle(fontSize: 24, color: Colors.red),
    );
  }
}
