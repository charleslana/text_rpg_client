import 'dart:convert';

class ResponseModel {
  ResponseModel({
    required this.message,
  });

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      message: map['message'] as String,
    );
  }

  final String message;

  ResponseModel copyWith({
    String? message,
  }) {
    return ResponseModel(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  String toJson() => json.encode(toMap());
}
