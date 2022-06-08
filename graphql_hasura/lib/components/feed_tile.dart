import 'package:flutter/material.dart';

class FeedTile extends StatelessWidget {
  const FeedTile({
    Key? key,
    required this.username,
    required this.feed,
  }) : super(key: key);
  
  final String username;
  final String feed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(username),
        subtitle: Text(feed),
      ),
    );
  }
}
