import 'package:flutter/material.dart';
import '../screens/container_visibility_manager.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerVisibilityManager(),
          ],
        ),
      ),
    );
  }
}
