import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
  });

  factory Location.fromJson(Map<String, dynamic> map) {
    return Location(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      dimension: map['dimension'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'dimension': dimension,
    };
  }

  @override
  List<Object?> get props => [id];

  final String id;
  final String name;
  final String type;
  final String dimension;
}
