import 'dart:convert';

class CharacterModel {
  final int id;
  final String characterClass;
  final String description;
  CharacterModel({
    required this.id,
    required this.characterClass,
    required this.description,
  });

  CharacterModel copyWith({
    int? id,
    String? characterClass,
    String? description,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      characterClass: characterClass ?? this.characterClass,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'characterClass': characterClass,
      'description': description,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      characterClass: map['characterClass'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<CharacterModel> listFromJson(List<dynamic> list) =>
      List<CharacterModel>.from(
          list.map((dynamic e) => CharacterModel.fromMap(e)));
}
