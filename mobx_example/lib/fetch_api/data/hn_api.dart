enum Type {
  newest,
  top;

  Uri get url {
    switch (this) {
      case Type.newest:
        return Uri.parse('https://hacker-news.firebaseio.com/v0/newstories.json');

      case Type.top:
        return Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json');
    }
  }
}

// extension on Type {
//   Uri get url {
//     switch (this) {
//       case Type.newest:
//         return Uri.parse('https://hacker-news.firebaseio.com/v0/newstories.json');

//       case Type.top:
//         return Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json');
//     }
//   }
// }

class FeedItem {
  FeedItem({
    required this.score,
    this.url,
    required this.title,
    required this.author,
  });

  final int score;
  final String? url;
  final String title;
  final String author;

  @override
  String toString() {
    return title;
  }

  factory FeedItem.fromJson(Map<String, dynamic> json) => FeedItem(
        score: json['score'],
        title: json['title'],
        author: json['by'],
        url: json['url'],
      );
}
