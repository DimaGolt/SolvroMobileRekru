import 'dart:convert';

import 'package:solvro_mobile_rekru/shared/domain/entities/user_entity.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/auth_repository.dart';
import 'package:http/http.dart' as http;

class RemoteAuthRepository implements AuthRepository {
  User? _user;

  @override
  Future<User> createUserWithEmail(String email, String password) async {
    final result = await http.post(
      Uri.parse('https://basket-buddy-solvro-api.kowalinski.dev/api/v1/auth/signup/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    if (result.statusCode == 200) {
      _user = User.fromJson(jsonDecode(result.body));
      return user!;
    } else {
      throw Exception('Failed to register');
    }
  }

  @override
  Future<User> loginEmail(String email, String password) async {
    final result = await http.post(
      Uri.parse('https://basket-buddy-solvro-api.kowalinski.dev/api/v1/auth/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    if (result.statusCode == 200) {
      _user = User.fromJson(jsonDecode(result.body));
      return user!;
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  User? get user => _user;

}