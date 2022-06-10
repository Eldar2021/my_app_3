import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../src.dart';

class Character extends Equatable {
  const Character({
    required this.id,
    required this.name,
    required this.vitalStatus,
    required this.gender,
    required this.type,
    required this.species,
    required this.image,
  });

  factory Character.fromJson(String source) => Character.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as String,
      name: map['name'] as String,
      vitalStatus: map['vitalStatus'] as VitalStatus,
      gender: map['gender'] as Gender,
      type: map['type'] as String,
      species: map['species'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'vitalStatus': vitalStatus.name,
      'gender': gender.name,
      'type': type,
      'species': species,
      'image': image,
    };
  }

  final String id;
  final String name;
  final VitalStatus vitalStatus;
  final Gender gender;
  final String type;
  final String species;
  final String image;
}
