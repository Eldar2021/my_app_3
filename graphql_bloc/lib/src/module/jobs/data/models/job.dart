import 'dart:convert';

List<Job> jobFromJson(String str) => List<Job>.from(
      json.decode(str).map((x) => Job.fromJson(x)),
    );

String jobToJson(List<Job> data) => json.encode(
      List<dynamic>.from(data.map((x) => x.toJson())),
    );

class Job {
  Job({
    required this.id,
    required this.title,
    this.locationNames,
    this.isFeatured,
  });

  final String id;
  final String title;
  final String? locationNames;
  final bool? isFeatured;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        title: json["title"],
        locationNames: json["locationNames"],
        isFeatured: json["isFeatured"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "locationNames": locationNames,
        "isFeatured": isFeatured,
      };
}
