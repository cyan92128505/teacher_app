import 'package:floor/floor.dart';
import 'package:teacher/entities/base_object.dart';
import 'package:teacher/entities/entities.dart';

@entity
class User extends BaseObject {
  final String userName;
  final String passwordHash;
  final String imageUrl;

  User({
    super.id,
    required super.updateTime,
    required super.createTime,
    required this.userName,
    required this.passwordHash,
    required this.imageUrl,
  });
}

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUser();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User?> findUserById(String id);

  @Query(
      'SELECT * FROM User WHERE userName = :userName AND passwordHash = :password')
  Future<User?> findUserByUserNameAndPassword(String userName, String password);

  @Query('''
SELECT * FROM User 
JOIN RoleUser ON User.id = RoleUser.userID
JOIN Role ON RoleUser.roleID = Role.id
WHERE Role.roleType = :type
''')
  Future<List<User>> findUserByRoleType(RoleType type);

  @insert
  Future<void> insertUser(User user);

  @insert
  Future<void> insertUsers(List<User> users);

  @update
  Future<void> updateUser(User user);

  @update
  Future<void> updateUsers(List<User> user);

  @delete
  Future<void> deleteUser(User user);

  @delete
  Future<void> deleteUsers(List<User> users);
}
