import 'package:floor/floor.dart';
import 'package:teacher/entities/base_object.dart';
import 'package:teacher/entities/role.dart';

@entity
class RoleUser extends BaseObject {
  final int userID;
  final int roleID;

  RoleUser({
    super.id,
    required super.updateTime,
    required super.createTime,
    required this.userID,
    required this.roleID,
  });
}

@dao
abstract class RoleUserDao {
  @Query('SELECT * FROM RoleUser')
  Future<List<RoleUser>> findAllRoleUser();

  @Query('''
SELECT * FROM RoleUser
AND userID = :userID
''')
  Future<List<RoleUser>> findAllRoleUserByUserID(
    String userID,
  );

  @Query('''
SELECT * FROM RoleUser
JOIN Role ON RoleUser.roleID = Role.id
WHERE Role.roleType = :type 
AND userID = :userID
''')
  Future<List<RoleUser>> findAllRoleUserByUserIDAndRoleType(
    RoleType type,
    String userID,
  );

  @Query('''
SELECT * FROM RoleUser 
JOIN Role ON RoleUser.roleID = Role.id
WHERE Role.roleType = :type
''')
  Future<List<RoleUser>> findUserByRoleType(RoleType type);

  @insert
  Future<void> insertRoleUser(RoleUser roleUser);

  @insert
  Future<void> insertRoleUsers(List<RoleUser> roleUsers);

  @update
  Future<void> updateRoleUser(RoleUser roleUser);

  @update
  Future<void> updateRoleUsers(List<RoleUser> roleUser);

  @delete
  Future<void> deleteRoleUser(RoleUser roleUser);

  @delete
  Future<void> deleteRoleUsers(List<RoleUser> roleUsers);
}
