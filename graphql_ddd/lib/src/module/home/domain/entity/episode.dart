import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'] as String,
      name: json['name'] as String,
      airDate: json['airDate'] as String,
      episode: json['episode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
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
