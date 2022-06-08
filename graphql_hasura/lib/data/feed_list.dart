import '../model/feed_item.dart';

class FeedList {
  List<FeedItem> list = [
    FeedItem(id: '1', username: 'user1', feed: "I'm user1"),
    FeedItem(id: '2', username: 'user2', feed: "I'm user2"),
    FeedItem(id: '3', username: 'user3', feed: "I'm user3"),
    FeedItem(id: '4', username: 'user4', feed: "I'm user4"),
    FeedItem(id: '5', username: 'user5', feed: "I'm user5"),
  ];

  addFeed(String id, String username, String feed) {
    list.add(FeedItem(id: id, username: username, feed: feed));
  }

  addfirstFeed(String id, String username, String feed) {
    list.insert(0, FeedItem(id: id, username: username, feed: feed));
  }
}

FeedList feedList = FeedList();
