import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quipster/pages/LoginPage.dart';

class Home extends StatelessWidget {
  final FirebaseAuth auth;
  
  const Home({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title:  Image.network("https://firebasestorage.googleapis.com/v0/b/quipster-628a0.appspot.com/o/appAssets%2FQLogo.png?alt=media&token=90132b3f-e04d-47ab-87c8-142925524ce2",height: 50,),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Row(
                children: [
                  // Profile pic
                  Image.network(
                    user?.photoURL ??
                        'https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png',
                    height: 40,
                  ),
                  // Rest Content
                  Column(
                    children: [
                      Text('Name: ${user?.displayName ?? 'Not available'}'),
                      Text('Email: ${user?.email ?? 'Not available'}'),
                      const Text('Online'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
