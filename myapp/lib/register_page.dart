import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            TextField(decoration: InputDecoration(labelText: 'Current Job')),
            TextField(decoration: InputDecoration(labelText: 'Session')),
            TextField(decoration: InputDecoration(labelText: 'Date of Birth')),
            TextField(decoration: InputDecoration(labelText: 'Skill 1')),
            TextField(decoration: InputDecoration(labelText: 'Skill 2')),
            TextField(decoration: InputDecoration(labelText: 'Skill 3')),
            TextField(decoration: InputDecoration(labelText: 'Skill 4')),
            TextField(decoration: InputDecoration(labelText: 'Hometown')),
          ],
        ),
      ),
    );
  }
}
