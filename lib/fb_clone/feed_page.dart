import 'package:flutter/material.dart';

class FBFeedPage extends StatelessWidget {
  const FBFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F2F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Color(0xFF1877F2),
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
            _CircleButton(icon: Icons.search, onPressed: () {}),
            _CircleButton(icon: Icons.message, onPressed: () {}),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFF1877F2),
            labelColor: Color(0xFF1877F2),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.people)),
              Tab(icon: Icon(Icons.ondemand_video)),
              Tab(icon: Icon(Icons.storefront)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.menu)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _HomeTab(),
            Center(child: Text('Friends')),
            Center(child: Text('Watch')),
            Center(child: Text('Marketplace')),
            Center(child: Text('Notifications')),
            Center(child: Text('Menu')),
          ],
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CircleButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 24),
        onPressed: onPressed,
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _CreatePostContainer()),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          sliver: SliverToBoxAdapter(
            child: _StoriesSection(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _PostCard(index: index);
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}

class _CreatePostContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 20, thickness: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ActionLabel(
                icon: Icons.videocam,
                color: Colors.red,
                label: 'Live',
              ),
              const VerticalDivider(width: 8),
              _ActionLabel(
                icon: Icons.photo_library,
                color: Colors.green,
                label: 'Photo',
              ),
              const VerticalDivider(width: 8),
              _ActionLabel(
                icon: Icons.video_call,
                color: Colors.purple,
                label: 'Room',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionLabel extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _ActionLabel({required this.icon, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: color),
      label: Text(label, style: const TextStyle(color: Colors.black)),
    );
  }
}

class _StoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 8),
        itemCount: 10,
        itemBuilder: (context, index) {
          final isOwner = index == 0;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: isOwner ? _StoryCard(isAddStory: true) : _StoryCard(index: index),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final int? index;

  const _StoryCard({this.isAddStory = false, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(isAddStory
              ? 'https://i.pravatar.cc/150?img=12'
              : 'https://picsum.photos/200/300?random=$index'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (isAddStory)
            Container(color: Colors.black12), // dimmed
          if (isAddStory)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 40,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                alignment: Alignment.center,
                child: const Text('Create Story', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
           if (isAddStory)
             const Positioned(
               bottom: 25,
               left: 0,
               right: 0,
               child: CircleAvatar(
                 backgroundColor: Colors.white,
                 radius: 16,
                 child: Icon(Icons.add_circle, color: Color(0xFF1877F2), size: 30),
               ),
             ),
           if (!isAddStory)
             Positioned(
               top: 8,
               left: 8,
               child: Container(
                 padding: const EdgeInsets.all(2), // border
                 decoration: const BoxDecoration(
                   color: Color(0xFF1877F2),
                   shape: BoxShape.circle,
                 ),
                 child: CircleAvatar(
                   radius: 16,
                   backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index! + 20}'),
                 ),
               ),
             ),
             if (!isAddStory)
              const Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Text(
                  'User Name',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final int index;
  const _PostCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index + 50}'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Friend Name $index',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text('${index + 1}h • ', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          Icon(Icons.public, color: Colors.grey[600], size: 12),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text('This is a beautiful post to show how the new UI looks better! #flutter #facebook_clone'),
          ),
          if (index % 2 == 0) // alternate images
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.network(
                'https://picsum.photos/600/400?random=$index',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Color(0xFF1877F2), shape: BoxShape.circle),
                  child: const Icon(Icons.thumb_up, color: Colors.white, size: 10),
                ),
                const SizedBox(width: 4),
                Text('${index * 15 + 10}'),
                const Spacer(),
                Text('${index + 2} comments'),
              ],
            ),
          ),
          const Divider(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _FooterButton(icon: Icons.thumb_up_outlined, label: 'Like'),
              _FooterButton(icon: Icons.chat_bubble_outline, label: 'Comment'),
              _FooterButton(icon: Icons.share_outlined, label: 'Share'),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FooterButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.grey[600], size: 20),
              const SizedBox(width: 4),
              Text(label, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}
