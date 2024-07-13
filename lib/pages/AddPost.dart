import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quipster/components/BottomNavigationBar.dart';

class AddPost extends StatefulWidget {
  final FirebaseAuth auth;
  final String photoURL;
  const AddPost({super.key, required this.auth, required this.photoURL});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: const Text('Post'))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Bottomnavigationbar(auth: widget.auth)));
            },
            icon: const Icon(
              Icons.close,
              color: Colors.blue,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.photoURL),
              radius: 22,
            ),
            const SizedBox(width: 12,),
            const Expanded(
              child:  TextField(
                decoration: InputDecoration(hintText: "What's happening..??",border: InputBorder.none,hintStyle: TextStyle(color: Color.fromARGB(255, 134, 134, 134))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
