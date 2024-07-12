import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:quipster/components/FeedCard.dart';
import 'package:quipster/pages/LoginPage.dart';

class Home extends StatelessWidget {
  final FirebaseAuth auth;

  const Home({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/quipster-628a0.appspot.com/o/appAssets%2FQLogo.png?alt=media&token=90132b3f-e04d-47ab-87c8-142925524ce2",
          height: 40,
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () async {
              await auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Loginpage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.black,
              // shape: RoundedRectangleBorder(
              //   side: const BorderSide(color: Colors.white38),
              //   borderRadius:
              //       BorderRadius.circular(10), // Adjust border radius as needed
              // ),
              child:
               Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text at the top
                children: [
                  // Profile pic
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(user?.photoURL ??
                        'https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  // Rest Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${user?.displayName ?? 'Not available'}',
                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        const Text(' Online',
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(height: 8), // Add some space between texts
                        const Text(
                          "🏏🇮🇳 What a thrilling victory! India reigns supreme in the T20 World Cup! 🎉🙌 #TeamIndia's incredible gameplay and sheer determination have made the nation proud! Let's celebrate this historic win together! 🏆🔥 #T20WorldCup #CricketFever",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // for like comment 
                  Column()
                ],
              ),
            ),
          ),
          SizedBox(height: 0.31,child: Container(color: Colors.white,),),
        ],
      ),
    );
  }
}
