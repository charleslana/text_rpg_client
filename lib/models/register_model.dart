import 'package:get/get.dart';
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
      return 'register.page.input.user.empty'.tr;
    }
    if (value.trim().length < 3 || value.trim().length > 20) {
      return 'register.page.input.user.min.character'.tr;
    }
    if (!isUser(value)) {
      return 'register.page.input.user.character.accept'.tr;
    }
    return null;
  }
}

class Email {
  Email(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'register.page.input.email.empty'.tr;
    }
    if (!validator.isEmail(value)) {
      return 'register.page.input.email.invalid'.tr;
    }
    return null;
  }
}

class Password {
  Password(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'register.page.input.password.empty'.tr;
    }
    if (value.trim().length < 6) {
      return 'register.page.input.password.min.character'.tr;
    }
    return null;
  }
}

class PasswordConfirmation {
  PasswordConfirmation(this.value);

  final String value;

  String? validate(String passwordConfirmation) {
    if (value.isEmpty) {
      return 'register.page.input.password.confirmation.empty'.tr;
    }
    if (value.trim().length < 6) {
      return 'register.page.input.password.confirmation.min.character'.tr;
    }
    if (value.trim() != passwordConfirmation.trim()) {
      return 'register.page.input.password.confirmation.different'.tr;
    }
    return null;
  }
}
