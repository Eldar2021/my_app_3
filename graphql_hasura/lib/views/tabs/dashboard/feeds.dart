import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../components/feed_tile.dart';
import '../../../data/feed_list.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: "Say something ...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  width: 90,
                  height: 50,
                  onTap: () {
                    feedList.addFeed("", "You", _controller.text);
                    _controller.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  text: "Post",
                ),
              )
            ],
          ),
        ),
        CustomButton(
          onTap: () {
            debugPrint("loading");
          },
          height: 50,
          text: "New Notification",
          width: MediaQuery.of(context).size.width / 2,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: feedList.list.length,
            itemBuilder: (context, index) {
              return FeedTile(
                username: feedList.list[feedList.list.length - index - 1].username,
                feed: feedList.list[feedList.list.length - index - 1].feed,
              );
            },
          ),
        ),
        CustomButton(
          onTap: () {
            debugPrint("load more");
          },
          height: 50,
          text: "Load More",
          width: MediaQuery.of(context).size.width / 3,
        )
      ],
    );
  }
}
