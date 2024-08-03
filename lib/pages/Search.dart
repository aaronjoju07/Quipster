import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchTerm = '';
  String locationFilter = '';
  List<String> selectedInterests = [];

  final List<User> users = [
    User(
      id: 1,
      username: "johndoe",
      name: "John Doe",
      location: "New York, USA",
      interests: ["photography", "travel", "technology", "business"],
      imageUrl:
          "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg",
    ),
    User(
      id: 2,
      username: "janedoe",
      name: "Jane Doe",
      location: "London, UK",
      interests: ["fashion", "art", "music", "political"],
      imageUrl: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg",
    ),
    User(
      id: 3,
      username: "bobsmith",
      name: "Bob Smith",
      location: "Sydney, Australia",
      interests: ["sports", "gaming", "coding"],
      imageUrl: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg",
    ),
    User(
      id: 4,
      username: "sarahjones",
      name: "Sarah Jones",
      location: "Tokyo, Japan",
      interests: ["travel", "food", "photography", "political", "business"],
      imageUrl: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg",
    ),
    User(
      id: 5,
      username: "mikebrownlee",
      name: "Mike Brownlee",
      location: "Berlin, Germany",
      interests: ["technology", "design", "entrepreneurship", "business"],
      imageUrl: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg",
    ),
  ];

  List<User> get filteredUsers {
    return users.where((user) {
      final usernameMatch =
          user.username.toLowerCase().contains(searchTerm.toLowerCase());
      final locationMatch =
          user.location.toLowerCase().contains(locationFilter.toLowerCase());
      final interestsMatch = selectedInterests.isEmpty ||
          selectedInterests.every((interest) => user.interests
              .map((i) => i.toLowerCase())
              .contains(interest.toLowerCase()));
      return usernameMatch && locationMatch && interestsMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            labelText: 'Search users...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onChanged: (value) {
            setState(() {
              searchTerm = value;
            });
          },
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Interests Filter
            Wrap(
              spacing: 8,
              children: [
                'sports',
                'gaming',
                'coding',
                'food',
                'design',
                'business',
                'political'
              ].map((interest) {
                return FilterChip(
                  backgroundColor: Colors.black,
                  selectedColor: Colors.black,
                  labelStyle: const TextStyle(color: Colors.white),
                  selectedShadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.white),
                  ),
                  label: Text(interest),
                  selected: selectedInterests.contains(interest),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedInterests.add(interest);
                      } else {
                        selectedInterests.remove(interest);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // User List
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return Card(
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Color.fromARGB(255, 60, 60, 60)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(user.imageUrl),
                            radius: 30,
                            child: user.imageUrl.isEmpty
                                ? Text(user.name[0])
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '@${user.username}',
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  user.location,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 4,
                                  children: user.interests.map((interest) {
                                    return Chip(
                                      backgroundColor: Colors.black,
                                      labelStyle: const TextStyle(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: const BorderSide(color: Colors.white),
                                      ),
                                      label: Text(interest),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String username;
  final String name;
  final String location;
  final List<String> interests;
  final String imageUrl;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.location,
    required this.interests,
    required this.imageUrl,
  });
}
