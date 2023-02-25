class LoginCredentialModel {
  User _user = User('');

  void setUser(String user) => _user = User(user);

  User get user => _user;

  Password _password = Password('');

  void setPassword(String password) => _password = Password(password);

  Password get password => _password;

  String? validate() {
    String? validate = _user.validate();
    if (validate != null) {
      return validate;
    }
    validate = _password.validate();
    if (validate != null) {
      return validate;
    }
    return null;
  }

  void fromMap(Map<String, dynamic> map) {
    setUser(map['user'] as String);
    setPassword(map['password'] as String);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': _user.value,
      'password': _password.value,
    };
  }
}

class User {
  User(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo do usuário não pode ser vazio';
    }
    return null;
  }
}

class Password {
  Password(this.value);

  final String value;

  String? validate() {
    if (value.isEmpty) {
      return 'O campo Senha não pode ser vazio';
    }
    return null;
  }
}
