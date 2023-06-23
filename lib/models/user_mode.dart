import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String uid;
  final String email;
  final String password;
  final String name;
  final String username;
  final List followers;
  final List following;
  User({
    required this.uid,
    required this.email,
    required this.password,
    required this.name,
    required this.username,
    required this.followers,
    required this.following,
  });

  User copyWith({
    String? uid,
    String? email,
    String? password,
    String? name,
    String? username,
    List? followers,
    List? following,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      username: username ?? this.username,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
      'username': username,
      'followers': followers,
      'following': following,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      followers: List.from((map['followers'] as List)),
      following: List.from(
        (map['following'] as List),
      ),
    );
  }

  factory User.fromNetwork(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      followers: map['followers'] ?? [],
      following: map['following'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uid: $uid, email: $email, password: $password, name: $name, username: $username, followers: $followers, following: $following)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.password == password &&
        other.name == name &&
        other.username == username &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        username.hashCode ^
        followers.hashCode ^
        following.hashCode;
  }
}
