import 'dart:convert';

import 'character_model.dart';

class AccountCharacterModel {
  final int id;
  final String name;
  final String experience;
  final int level;
  final int strength;
  final int intelligence;
  final int dexterity;
  final int pointsLevel;
  final String alz;
  final DateTime createdAt;
  final CharacterModel character;
  AccountCharacterModel({
    required this.id,
    required this.name,
    required this.experience,
    required this.level,
    required this.strength,
    required this.intelligence,
    required this.dexterity,
    required this.pointsLevel,
    required this.alz,
    required this.createdAt,
    required this.character,
  });

  AccountCharacterModel copyWith({
    int? id,
    String? name,
    String? experience,
    int? level,
    int? strength,
    int? intelligence,
    int? dexterity,
    int? pointsLevel,
    String? alz,
    DateTime? createdAt,
    CharacterModel? character,
  }) {
    return AccountCharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      experience: experience ?? this.experience,
      level: level ?? this.level,
      strength: strength ?? this.strength,
      intelligence: intelligence ?? this.intelligence,
      dexterity: dexterity ?? this.dexterity,
      pointsLevel: pointsLevel ?? this.pointsLevel,
      alz: alz ?? this.alz,
      createdAt: createdAt ?? this.createdAt,
      character: character ?? this.character,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'experience': experience,
      'level': level,
      'strength': strength,
      'intelligence': intelligence,
      'dexterity': dexterity,
      'pointsLevel': pointsLevel,
      'alz': alz,
      'created_at': createdAt.toIso8601String(),
      'character': character.toMap(),
    };
  }

  factory AccountCharacterModel.fromMap(Map<String, dynamic> map) {
    return AccountCharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      experience: map['experience'] as String,
      level: map['level'] as int,
      strength: map['strength'] as int,
      intelligence: map['intelligence'] as int,
      dexterity: map['dexterity'] as int,
      pointsLevel: map['pointsLevel'] as int,
      alz: map['alz'] as String,
      createdAt: DateTime.parse(map['created_at']),
      character:
          CharacterModel.fromMap(map['character'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountCharacterModel.fromJson(String source) =>
      AccountCharacterModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  static List<AccountCharacterModel> listFromJson(List<dynamic> list) =>
      List<AccountCharacterModel>.from(
          list.map((dynamic e) => AccountCharacterModel.fromMap(e)));
}
