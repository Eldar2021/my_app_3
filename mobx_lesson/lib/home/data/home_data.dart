import 'dart:convert';

List<Home> homeFromJson(String str) => List<Home>.from(
      json.decode(str).map((x) => Home.fromJson(x)),
    );

// String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  Home({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
