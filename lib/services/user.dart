import 'package:teacher/entities/entities.dart';
import 'package:teacher/models/models.dart';
import 'package:teacher/repositories/user.dart';
import 'package:teacher/utils/local_storage.dart';

class UserService {
  final UserRepository repository;
  UserService(this.repository);

  Future<void> login({
    required String username,
    required String password,
    required RoleType type,
  }) async {
    final token = await repository.login(
      username: username,
      password: password,
      type: type,
    );

    if (token == null) {
      return;
    }

    LocalStoregeKey.accessToken.update(token);
  }

  Future<void> logout() async {
    LocalStoregeKey.accessToken.clean();
  }

  Future<UserDTO?> register(UserDTO user) async {
    return repository.register(user);
  }
}
