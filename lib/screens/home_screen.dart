import 'package:flutter/material.dart';
import 'package:skill_guru/screens/name_select/views.dart';
import 'package:skill_guru/widget/base_layout.dart';
import 'package:skill_guru/widget/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Accueil',
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Skill Guru!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Get started',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NameSelect()),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      );
  }
}