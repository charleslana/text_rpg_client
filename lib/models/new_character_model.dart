import 'package:text_rpg_client/enums/gender_enum.dart';

import '../utils/functions.dart';

class NewCharacterModel {
  Name _name = Name('');

  void setName(String name) => _name = Name(name);

  Name get name => _name;

  int? _characterId;

  void setCharacterId(int characterId) => _characterId = characterId;

  int? get characterId => _characterId;

  String? _gender;

  void setGender(GenderEnum gender) => _gender = gender.name.toUpperCase();

  String? get gender => _gender;

  String? validate() {
    String? validate = _name.validate();
    if (validate != null) {
      return validate;
    }
    if (_characterId == null) {
      return 'Você deve escolher uma classe de personagem';
    }
    if (_gender == null) {
      return 'Você deve escolher uma classe de personagem';
    }
    return null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': _name.value,
      'characterId': _characterId,
      'gender': _gender,
    };
  }
}

class Name {
  Name(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo nome não pode ser vazio';
    }
    if (value.trim().length < 3 || value.trim().length > 20) {
      return 'O nome deve conter no mínimo 6 caracteres e no máximo 20 caracteres';
    }
    if (!isUser(value)) {
      return 'O nome pode conter letras, números e caractere underscore';
    }
    return null;
  }
}
