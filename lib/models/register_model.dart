import 'package:validators/validators.dart' as validator;

import '../utils/functions.dart';

class RegisterModel {
  User _user = User('');

  void setUser(String user) => _user = User(user);

  User get user => _user;

  Email _email = Email('');

  void setEmail(String email) => _email = Email(email);

  Email get email => _email;

  Password _password = Password('');

  void setPassword(String password) => _password = Password(password);

  Password get password => _password;

  PasswordConfirmation _passwordConfirmation = PasswordConfirmation('');

  void setConfirmPassword(String confirmPassword) =>
      _passwordConfirmation = PasswordConfirmation(confirmPassword);

  PasswordConfirmation get confirmPassword => _passwordConfirmation;

  String? validate() {
    String? validate = _user.validate();
    if (validate != null) {
      return validate;
    }
    validate = _email.validate();
    if (validate != null) {
      return validate;
    }
    validate = _password.validate();
    if (validate != null) {
      return validate;
    }
    validate = _passwordConfirmation.validate(_password.value);
    if (validate != null) {
      return validate;
    }
    return null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': _user.value,
      'email': _email.value,
      'password': _password.value,
      'passwordConfirmation': _passwordConfirmation.value,
    };
  }
}

class User {
  User(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo nome de usuário não pode ser vazio';
    }
    if (value.trim().length < 3 || value.trim().length > 20) {
      return 'O nome de usuário deve conter no mínimo 6 caracteres e no máximo 20 caracteres';
    }
    if (!isUser(value)) {
      return 'O nome de usuário pode conter letras, números e caractere underscore';
    }
    return null;
  }
}

class Email {
  Email(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo email não pode ser vazio';
    }
    if (!validator.isEmail(value)) {
      return 'E-mail inválido';
    }
    return null;
  }
}

class Password {
  Password(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo senha não pode ser vazio';
    }
    if (value.trim().length < 6) {
      return 'A senha deve conter no mínimo 6 caracteres';
    }
    return null;
  }
}

class PasswordConfirmation {
  PasswordConfirmation(this.value);

  final String value;

  String? validate(String confirmPassword) {
    if (value.isEmpty) {
      return 'O campo confirmar senha não pode ser vazio';
    }
    if (value.trim().length < 6) {
      return 'A confirmação da senha deve conter no mínimo 6 caracteres';
    }
    if (value.trim() != confirmPassword.trim()) {
      return 'As senhas digitadas estão diferentes';
    }
    return null;
  }
}
