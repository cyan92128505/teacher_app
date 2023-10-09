import 'package:floor/floor.dart';
import 'package:teacher/entities/base_object.dart';

enum RoleType {
  student,
  lecturer;

  String get value => switch (this) {
        RoleType.student => 'student',
        RoleType.lecturer => 'lecturer',
      };
}

class RoleTypeConverter extends TypeConverter<RoleType?, String?> {
  @override
  RoleType? decode(String? databaseValue) {
    return databaseValue == null ? null : RoleType.values.byName(databaseValue);
  }

  @override
  String? encode(RoleType? value) {
    return value?.name;
  }
}

@entity
class Role extends BaseObject {
  final String roleName;
  final String roleTitle;
  final RoleType roleType;

  Role({
    super.id,
    required super.updateTime,
    required super.createTime,
    required this.roleName,
    required this.roleTitle,
    required this.roleType,
  });
}

@dao
abstract class RoleDao {
  @Query('SELECT * FROM Role')
  Future<List<Role>> findAllRole();

  @Query('SELECT * FROM Role WHERE roleType = :roleType')
  Future<Role?> findRoleByType(RoleType roleType);

  @insert
  Future<void> insertRole(Role role);

  @insert
  Future<void> insertRoles(List<Role> roles);

  @update
  Future<void> updateRole(Role role);

  @update
  Future<void> updateRoles(List<Role> role);

  @delete
  Future<void> deleteRole(Role role);

  @delete
  Future<void> deleteRoles(List<Role> roles);
}
