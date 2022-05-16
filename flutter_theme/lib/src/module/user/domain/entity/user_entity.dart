import 'dart:convert';

User userFromJson(String str) => User.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

class User {
  User({
    // required this.page,
    // required this.perPage,
    // required this.total,
    // required this.totalPages,
    required this.data,
  });

  // final int page;
  // final int perPage;
  // final int total;
  // final int totalPages;
  final List<Datum> data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        // page: json["page"],
        // perPage: json["per_page"],
        // total: json["total"],
        // totalPages: json["total_pages"],
        data: List<Datum>.from(
          json["data"].map<dynamic>(
            (dynamic x) => Datum.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );
}

class Datum {
  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int,
        email: json['email'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        avatar: json['avatar'] as String,
      );
}
