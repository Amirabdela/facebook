import 'package:flutter/material.dart';

class FBProfilePage extends StatelessWidget {
  const FBProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        children: [
          Container(
            height: 140,
            color: Colors.grey[300],
            child: Stack(
              children: [
                Align(alignment: Alignment.center, child: Container()),
                Positioned(
                  left: 16,
                  bottom: -28,
                  child: CircleAvatar(
                    radius: 48,
                    child: Icon(Icons.person, size: 48),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'User Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Bio: This is an example profile bio.'),
                SizedBox(height: 12),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Photos'),
          ),
          ListTile(leading: const Icon(Icons.info), title: const Text('About')),
        ],
      ),
    );
  }
}
