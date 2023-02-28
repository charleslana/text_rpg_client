import 'dart:convert';

class AccountModel {
  final int id;
  final String? user;
  final DateTime? premiumDate;
  final int? pointsLogged;
  final String? cash;
  final DateTime? createdAt;
  AccountModel({
    required this.id,
    this.user,
    this.premiumDate,
    this.pointsLogged,
    this.cash,
    this.createdAt,
  });

  AccountModel copyWith({
    int? id,
    String? user,
    DateTime? premiumDate,
    int? pointsLogged,
    String? cash,
    DateTime? createdAt,
  }) {
    return AccountModel(
      id: id ?? this.id,
      user: user ?? this.user,
      premiumDate: premiumDate ?? this.premiumDate,
      pointsLogged: pointsLogged ?? this.pointsLogged,
      cash: cash ?? this.cash,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'premiumDate': premiumDate?.toIso8601String(),
      'pointsLogged': pointsLogged,
      'cash': cash,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as int,
      user: map['user'] != null ? map['user'] as String : null,
      premiumDate: map['premiumDate'] != null
          ? DateTime.parse(map['premiumDate'])
          : null,
      pointsLogged:
          map['pointsLogged'] != null ? map['pointsLogged'] as int : null,
      cash: map['cash'] != null ? map['cash'] as String : null,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
