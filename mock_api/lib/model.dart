import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  final int id;
  final String name;

  Model({required this.id, required this.name});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}
