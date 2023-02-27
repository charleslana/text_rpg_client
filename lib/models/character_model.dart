import 'dart:convert';

class CharacterModel {
  final int id;
  final String characterClass;
  CharacterModel({
    required this.id,
    required this.characterClass,
  });

  CharacterModel copyWith({
    int? id,
    String? characterClass,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      characterClass: characterClass ?? this.characterClass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'characterClass': characterClass,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      characterClass: map['characterClass'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
