// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:intl/intl.dart';

class UserModel {
  final String id;
  final String email;
  final String username;
  final DateTime birthday;
  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.birthday,
  });

  String get birthdayFormated => DateFormat('dd/MM/yyyy').format(birthday);

  UserModel copyWith({
    String? id,
    String? email,
    String? username,
    DateTime? birthday,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      birthday: birthday ?? this.birthday,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'birthday': birthday.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      birthday: DateTime.parse(map['birthday'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(id: $id, email: $email, username: $username birthday: $birthday)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.username == username &&
        other.birthday == birthday;
  }

  @override
  int get hashCode =>
      id.hashCode ^ email.hashCode ^ username.hashCode ^ birthday.hashCode;
}
