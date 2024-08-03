import 'package:flutter/material.dart';
import 'package:quipster/components/FeedCard.dart';
import 'package:quipster/data/list_data.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('John Doe',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white)),backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            RecentPostsAndProjects(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/placeholder-user.jpg'),
            child:
                Text('JP', style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Software Engineer at Acme Inc. Passionate about building scalable and performant web applications.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileStat(title: 'Posts', value: '42'),
                    ProfileStat(title: 'Projects', value: '18'),
                    ProfileStat(title: 'Followers', value: '1.2K'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String title;
  final String value;

  ProfileStat({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}

// RecentPostsAndProjects widget
class RecentPostsAndProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: posts.map((post) {
        return FeedCard(
          userProfileImageUrl: post['userProfileImageUrl'],
          userName: post['userName'],
          userUid: post['userUid'],
          userEmail: post['userEmail'],
          userPost: post['userPost'],
          islike:
              false, // You can set initial state of likes as per your requirement
        );
      }).toList(),
    );
  }
}
