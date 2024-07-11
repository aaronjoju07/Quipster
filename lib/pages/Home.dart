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
        title: const Text('Home'),
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
            Text('Welcome, ${user?.displayName ?? 'User'}!', style: TextStyle(color: Colors.white),),
            Text('Email: ${user?.email ?? 'Not available'}'),
          ],
        ),
      ),
    );
  }
}
