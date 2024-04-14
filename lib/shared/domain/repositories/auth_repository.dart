import '../../data/app_auth_repository.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  User? get user;

  Future<User> createUserWithEmail(String email, String password);

  Future<User> loginEmail(String email, String password);

  factory AuthRepository.build() => AppAuthRepository();
}

class AuthException implements Exception {
  final String message;

  AuthException({required this.message});

  @override
  String toString() {
    return message;
  }
}