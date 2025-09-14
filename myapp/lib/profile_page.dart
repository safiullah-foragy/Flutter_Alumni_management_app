import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        children: const [
          CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/placeholder.png')),
          SizedBox(height: 10),
          Text('User Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Current Job: Software Engineer'),
          Text('Session: 2015-2019'),
          Text('Skills: Dart, Flutter, Firebase, SQL'),
          Text('Hometown: Dhaka'),
        ],
      ),
    );
  }
}
