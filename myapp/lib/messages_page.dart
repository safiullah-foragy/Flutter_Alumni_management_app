import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> conversations = [
      {'name': 'John Doe', 'last': 'Hey there!', 'unseen': 2},
      {'name': 'Jane Smith', 'last': 'Meeting at 5?', 'unseen': 0},
      {'name': 'Alex', 'last': 'See you soon', 'unseen': 1},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final c = conversations[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(c['name'] as String),
            subtitle: Text(c['last'] as String),
            trailing: (c['unseen'] as int) > 0
                ? CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${c['unseen']}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                : null,
            onTap: () {
              // TODO: Navigate to conversation page
            },
          );
        },
      ),
    );
  }
}
