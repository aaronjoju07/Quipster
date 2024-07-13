import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quipster/components/FeedCard.dart';
import 'package:quipster/pages/AddPost.dart';
import 'package:quipster/pages/LoginPage.dart';

class Home extends StatelessWidget {
  final FirebaseAuth auth;

  const Home({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    print(user?.photoURL.runtimeType);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/quipster-628a0.appspot.com/o/appAssets%2FQLogo.png?alt=media&token=90132b3f-e04d-47ab-87c8-142925524ce2",
          height: 50,
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
          SizedBox(
            height: 0.17,
            child: Container(
              color: Colors.white,
            ),
          ),
          FeedCard(
            userProfileImageUrl: user?.photoURL,
            userName: user?.displayName,
            userUid: user?.uid,
            userEmail: user?.email,
            islike: true,
            userPost:
                "🏏🇮🇳 What a thrilling victory! India reigns supreme in the T20 World Cup! 🎉🙌 #TeamIndia's incredible gameplay and sheer determination have made the nation proud! Let's celebrate this historic win together! 🏆🔥 #T20WorldCup #CricketFever",
          ),
          SizedBox(height: 0.31, child: Container(color: Colors.white)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AddPost(auth: auth, photoURL:"${user?.photoURL}")),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
