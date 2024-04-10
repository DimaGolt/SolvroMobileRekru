import 'dart:convert';

class User {
  final int id;
  final String token;

  User({required this.id, required this.token});

  User.fromJson(Map<String, Object?> json)
      : this(
          token: json['token'] as String,
          id: (json['user'] as Map<String, Object?>)['id'] as int,
        );
}
