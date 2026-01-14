import 'package:flutter/material.dart';

class FBProfilePage extends StatelessWidget {
  const FBProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'), // Or User Name
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/800/400'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -60 + 10,
                  right: MediaQuery.of(context).size.width / 2 - 50,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt, color: Colors.black, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            const Text(
              'User Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Text(
                'Digital Creator • Travel Enthusiast • Flutter Developer',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1877F2)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Icon(Icons.add_circle, size: 18),
                           SizedBox(width: 4),
                           Text('Add to Story'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Icon(Icons.edit, size: 18),
                           SizedBox(width: 4),
                           Text('Edit Profile'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
                    child: IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
                  ),
                ],
              ),
            ),
            const Divider(height: 30),
            _ProfileInfoSection(),
            const Divider(height: 30),
            _FriendsGrid(),
            const Divider(height: 30),
            _UserPosts(),
          ],
        ),
      ),
    );
  }
}

class _ProfileInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _InfoRow(icon: Icons.work, text: 'Works at Flutter'),
          _InfoRow(icon: Icons.school, text: 'Studied at University of Tech'),
          _InfoRow(icon: Icons.home, text: 'Lives in San Francisco'),
          _InfoRow(icon: Icons.location_on, text: 'From New York'),
          _InfoRow(icon: Icons.more_horiz, text: 'See your About info'),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700], size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class _FriendsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Friends', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('1,234 friends', style: TextStyle(color: Colors.grey)),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text('Find Friends')),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage('https://i.pravatar.cc/150?img=${index + 30}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Friend $index', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              );
            },
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                elevation: 0,
              ),
              child: const Text('See All Friends'),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Posts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Container(
            height: 100,
            color: Colors.grey[200], // Placeholder for post creation
            alignment: Alignment.center,
            child: const Text('Create a post...'),
          ),
          const SizedBox(height: 12),
          // A sample previous post
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                 const ListTile(
                   leading: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12')),
                   title: Text('User Name'),
                   subtitle: Text('Yesterday at 11:30 AM'),
                 ),
                 Image.network('https://picsum.photos/600/300', fit: BoxFit.cover),
                 Padding(
                   padding: const EdgeInsets.all(12),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: const [
                       Icon(Icons.thumb_up_outlined),
                       Icon(Icons.comment_outlined),
                       Icon(Icons.share_outlined),
                     ],
                   ),
                 ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
