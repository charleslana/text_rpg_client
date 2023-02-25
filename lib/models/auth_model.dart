import 'dart:convert';

class AuthModel {
  AuthModel({
    required this.accessToken,
    this.cookie,
  });

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      accessToken: map['accessToken'] as String,
      cookie: map['cookie'] != null ? map['cookie'] as String : null,
    );
  }

  final String accessToken;
  final String? cookie;

  AuthModel copyWith({
    String? accessToken,
    String? cookie,
  }) {
    return AuthModel(
      accessToken: accessToken ?? this.accessToken,
      cookie: cookie ?? this.cookie,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'cookie': cookie,
    };
  }

  String toJson() => json.encode(toMap());
}
