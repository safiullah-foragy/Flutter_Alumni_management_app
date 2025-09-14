import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'events_page.dart';
import 'members_page.dart';
import 'messages_page.dart';
import 'jobs_page.dart';
import 'settings_page.dart';

class NewsfeedPage extends StatelessWidget {
  const NewsfeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newsfeed'),
        actions: [
          IconButton(icon: const Icon(Icons.person), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
          }),
          IconButton(icon: const Icon(Icons.video_library), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const EventsPage()));
          }),
          IconButton(icon: const Icon(Icons.group), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const MembersPage()));
          }),
          IconButton(icon: const Icon(Icons.message), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const MessagesPage()));
          }),
          IconButton(icon: const Icon(Icons.work), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const JobsPage()));
          }),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
          }),
        ],
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Sample post 1'), subtitle: Text('Content here...')),
          ListTile(title: Text('Sample post 2'), subtitle: Text('Content here...')),
        ],
      ),
    );
  }
}
