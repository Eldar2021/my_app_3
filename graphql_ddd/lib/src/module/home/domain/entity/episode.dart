import 'dart:convert';

import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });

  factory Episode.fromJson(String source) => Episode.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      id: map['id'] as String,
      name: map['name'] as String,
      airDate: map['airDate'] as String,
      episode: map['episode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'airDate': airDate,
      'episode': episode,
    };
  }

  @override
  List<Object?> get props => [id];

  final String id;
  final String name;
  final String airDate;
  final String episode;
}
