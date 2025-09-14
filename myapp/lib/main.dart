import 'package:flutter/material.dart';
import 'login_page.dart';
import 'newsfeed_page.dart';

void main() {
  runApp(const AlumniApp());
}

class AlumniApp extends StatelessWidget {
  const AlumniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alumni App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
      routes: {
        '/newsfeed': (context) => const NewsfeedPage(),
      },
    );
  }
}
