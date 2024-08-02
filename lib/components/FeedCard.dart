import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedCard extends StatefulWidget {
  final String? userProfileImageUrl;
  final String? userName;
  final String? userUid;
  final String? userEmail;
  final String? userPost;
  final bool? islike; 

  const FeedCard({
    Key? key,
    this.userProfileImageUrl,
    this.userName,
    this.userUid,
    this.userEmail,
    this.userPost,
    this.islike,
  }) : super(key: key);

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  bool _isLiked = false;
  @override
  void initState() {
    super.initState();
    _isLiked = widget.islike ?? false; // Initialize _isLiked from widget prop
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile pic
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(widget.userProfileImageUrl ??
                    'https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png'),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName ?? 'Not available',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@${widget.userEmail ?? 'Email not available'}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.userPost ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isLiked = !_isLiked;
                            });
                          },
                          icon: Icon(
                            _isLiked
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle comment button press
                          },
                          icon: const Icon(
                             Icons.comment_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle share button press
                          },
                          icon:const Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
