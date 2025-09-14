import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Email')),
            ElevatedButton(
              onPressed: () {
                // TODO: Email OTP system
              },
              child: const Text('Send OTP'),
            )
          ],
        ),
      ),
    );
  }
}
