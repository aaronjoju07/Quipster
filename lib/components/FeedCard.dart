import 'package:flutter/material.dart';

class FeedCard extends StatefulWidget {
  final String feed;
  const FeedCard({Key? key, required this.feed}) : super(key: key);
  
  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(' ${widget.feed}'), // Use widget.feed to access the feed property
    );
  }
}
