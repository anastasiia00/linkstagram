import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String uid;
  final String email;
  final String? password;
  final String name;
  final String username;
  final List followers;
  final List following;
  final String? avatar;

  User({
    required this.uid,
    required this.email,
    this.password,
    required this.name,
    required this.username,
    required this.followers,
    required this.following,
    this.avatar,
  });

  User copyWith({
    String? uid,
    String? email,
    String? password,
    String? name,
    String? username,
    List? followers,
    List? following,
    String? avatar,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      username: username ?? this.username,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      avatar: avatar ?? this.avatar,
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
      'avatar': avatar,
    };
  }

  factory User.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot["uid"],
      email: snapshot["email"],
      name: snapshot["name"],
      username: snapshot["username"],
      followers: snapshot["followers"],
      following: snapshot["following"],
      avatar: snapshot["avatar"],
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
      avatar: map['avatar'] ?? '',
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      followers: List.from((map['followers'] as List)),
      following: List.from((map['following'] as List)),
      avatar: map['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "password": password,
        "name": name,
        "username": username,
        "avatar": avatar,
        "followers": followers,
        "following": following,
      };

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uid: $uid, email: $email, password: $password, name: $name, username: $username, followers: $followers, following: $following, avatar: $avatar)';
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
        listEquals(other.following, following) &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        username.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        avatar.hashCode;
  }
}
