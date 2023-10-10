import 'package:teacher/database.dart';
import 'package:teacher/entities/entities.dart';
import 'package:teacher/models/models.dart';
import 'package:teacher/utils/jwt.dart';
import 'package:teacher/utils/password.dart';

abstract class UserRepository {
  Future<String?> login({
    required String username,
    required String password,
    required RoleType type,
  }) async {
    return '';
  }

  Future<void> logout() async {}

  Future<UserDTO?> register(UserDTO user) async {
    return const UserDTO();
  }
}

class LocalUserRepository extends UserRepository {
  @override
  Future<String?> login({
    required String username,
    required String password,
    required RoleType type,
  }) async {
    final db = await DatabaseHelper().database;

    final passwordHash = generatePassword(password);

    final existUser = await db.userDao.findUserByUserNameAndPassword(
      username,
      passwordHash,
    );

    if (existUser == null) {
      return null;
    }

    final roleList = await db.roleUserDao.findAllRoleUserByUserIDAndRoleType(
      type,
      '${existUser.id}',
    );

    if (roleList.isEmpty) {
      return null;
    }

    return await JWTUtils.sign(existUser, type);
  }

  @override
  Future<void> logout() async {}

  @override
  Future<UserDTO?> register(UserDTO user) async {
    final db = await DatabaseHelper().database;

    final passwordHash = generatePassword(user.password);
    final now = DateTime.now().toIso8601String();

    await db.userDao.insertUser(User(
      userName: user.userName,
      passwordHash: passwordHash,
      imageUrl: user.imageUrl,
      updateTime: now,
      createTime: now,
    ));

    final existUser = await db.userDao.findUserByUserNameAndPassword(
      user.userName,
      passwordHash,
    );

    final role = await db.roleDao.findRoleByType(RoleType.student);

    if (role == null) {
      return null;
    }

    await db.roleUserDao.insertRoleUser(RoleUser(
      updateTime: now,
      createTime: now,
      roleID: role.id!,
      userID: existUser!.id!,
    ));

    return user.copyWith(
      id: '${existUser.id!}',
      createdAt: DateTime.parse(existUser.createTime),
      password: '',
    );
  }
}
