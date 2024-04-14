import 'package:solvro_mobile_rekru/shared/data/remote/remote_auth_repository.dart';
import 'package:solvro_mobile_rekru/shared/domain/entities/user_entity.dart';
import 'package:solvro_mobile_rekru/shared/domain/repositories/auth_repository.dart';

class AppAuthRepository implements AuthRepository {
  final _remote = RemoteAuthRepository();

  @override
  Future<User> createUserWithEmail(String email, String password) async {
    final user = await _remote.createUserWithEmail(email, password);
    return user;
  }

  @override
  Future<User> loginEmail(String email, String password) async {
    final user = await _remote.loginEmail(email, password);
    return user;
  }

  @override
  User? get user => _remote.user;

}