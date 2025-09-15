import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'events_page.dart';
import 'members_page.dart';
import 'messages_page.dart';
import 'jobs_page.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional Network',
      debugShowCheckedModeBanner: false, // Remove debug banner here
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NewsfeedPage(),
    );
  }
}

class NewsfeedPage extends StatefulWidget {
  const NewsfeedPage({super.key});

  @override
  State<NewsfeedPage> createState() => _NewsfeedPageState();
}

class _NewsfeedPageState extends State<NewsfeedPage> {
  // Track which icon is being hovered
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Newsfeed',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue[700],
        elevation: 1,
        actions: [
          // Profile icon with hover effect
          _buildAppBarIcon(
            icon: Icons.person,
            index: 0,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
            },
          ),
          // Events icon with hover effect
          _buildAppBarIcon(
            icon: Icons.video_library,
            index: 1,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const EventsPage()));
            },
          ),
          // Members icon with hover effect
          _buildAppBarIcon(
            icon: Icons.group,
            index: 2,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MembersPage()));
            },
          ),
          // Messages icon with hover effect
          _buildAppBarIcon(
            icon: Icons.message,
            index: 3,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MessagesPage()));
            },
          ),
          // Jobs icon with hover effect
          _buildAppBarIcon(
            icon: Icons.work,
            index: 4,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const JobsPage()));
            },
          ),
          // Settings icon with hover effect
          _buildAppBarIcon(
            icon: Icons.settings,
            index: 5,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildCreatePostCard(),
          _buildPost(
            name: 'Sarah Johnson',
            time: '2 hrs ago',
            content:
                'Just completed an amazing Flutter project! The power of cross-platform development never ceases to impress me.',
            likes: 24,
            comments: 7,
          ),
          _buildPost(
            name: 'Michael Chen',
            time: '5 hrs ago',
            content:
                'Our team is hiring senior developers! If you have experience with Dart and Flutter, reach out to me directly.',
            likes: 42,
            comments: 15,
            isPromoted: true,
          ),
          _buildPost(
            name: 'Tech Innovations Inc.',
            time: 'Yesterday',
            content:
                'We just launched our new product! Check out the revolutionary features that will change how you work.',
            likes: 128,
            comments: 32,
          ),
          _buildPost(
            name: 'Jessica Williams',
            time: '2 days ago',
            content:
                'Just attended the Flutter conference. So many great insights about the future of mobile development!',
            likes: 56,
            comments: 12,
          ),
        ],
      ),
    );
  }

  // Helper method to build app bar icons with hover effect
  Widget _buildAppBarIcon({
    required IconData icon,
    required int index,
    required VoidCallback onPressed,
  }) {
    return MouseRegion(
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = null),
      child: IconButton(
        icon: Icon(icon,
            color: hoveredIndex == index ? Colors.blue[800] : Colors.blue[600],
            size: hoveredIndex == index ? 28 : 24),
        onPressed: onPressed,
      ),
    );
  }

  // Create post card widget
  Widget _buildCreatePostCard() {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/1.jpg'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPostButton(
                  icon: Icons.video_call,
                  color: Colors.red,
                  text: 'Live',
                ),
                _buildPostButton(
                  icon: Icons.photo_library,
                  color: Colors.green,
                  text: 'Photo',
                ),
                _buildPostButton(
                  icon: Icons.location_on,
                  color: Colors.purple,
                  text: 'Check-in',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for post buttons
  Widget _buildPostButton({
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 5),
              Text(text, style: TextStyle(color: Colors.grey[700])),
            ],
          ),
        ),
      ),
    );
  }

  // Build a post widget
  Widget _buildPost({
    required String name,
    required String time,
    required String content,
    required int likes,
    required int comments,
    bool isPromoted = false,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/2.jpg'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                ),
                if (isPromoted)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('Promoted',
                        style: TextStyle(fontSize: 12, color: Colors.blue[700])),
                  ),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.grey[600]),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(content),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.thumb_up, size: 16, color: Colors.blue[700]),
                const SizedBox(width: 5),
                Text('$likes', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                const SizedBox(width: 15),
                Icon(Icons.comment, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 5),
                Text('$comments comments',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPostActionButton(icon: Icons.thumb_up, text: 'Like'),
                _buildPostActionButton(icon: Icons.comment, text: 'Comment'),
                _buildPostActionButton(icon: Icons.share, text: 'Share'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for post action buttons
  Widget _buildPostActionButton({required IconData icon, required String text}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Icon(icon, size: 18, color: Colors.grey[700]),
              const SizedBox(width: 5),
              Text(text, style: TextStyle(color: Colors.grey[700])),
            ],
          ),
        ),
      ),
    );
  }
}