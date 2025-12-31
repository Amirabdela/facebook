import 'package:flutter/material.dart';

class FBFeedPage extends StatelessWidget {
  const FBFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    const fbBlue = Color(0xFF1877F2);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fbBlue,
        title: const Text('Facebook'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/fb_profile'),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(radius: 22, child: Icon(Icons.person)),
                      SizedBox(width: 12),
                      Expanded(child: Text('What\'s on your mind?')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(6, (i) => _postCard(i)),
        ],
      ),
    );
  }

  Widget _postCard(int i) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(child: Icon(Icons.person)),
                SizedBox(width: 8),
                Expanded(child: Text('Friend Name')),
                Text('2h'),
              ],
            ),
            const SizedBox(height: 8),
            const Text('This is a sample post to demonstrate a feed layout.'),
            const SizedBox(height: 8),
            Container(height: 140, color: Colors.grey[300]),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.thumb_up_alt_outlined),
                Icon(Icons.comment_outlined),
                Icon(Icons.share_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
