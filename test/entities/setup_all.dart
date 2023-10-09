import 'package:teacher/database.dart';
import 'package:teacher/entities/entities.dart';
import 'package:teacher/utils/password.dart';

setupAll(
  AppDatabase database,
  UserDao userDao,
  RoleDao roleDao,
  RoleUserDao roleUserDao,
) async {
  database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
  final now = DateTime.now().toIso8601String();
  userDao = database.userDao;
  userDao.insertUser(User(
    id: 0,
    userName: 'Teacher 1',
    passwordHash: generatePassword('ABCD1234'),
    imageUrl: 'https://i.pravatar.cc/150?img=1',
    createTime: now,
    updateTime: now,
  ));

  roleDao = database.roleDao;
  roleDao.insertRoles([
    Role(
      id: 0,
      roleName: RoleType.lecturer.value,
      roleTitle: RoleType.lecturer.value,
      roleType: RoleType.lecturer,
      createTime: now,
      updateTime: now,
    ),
    Role(
      id: 1,
      roleName: RoleType.student.value,
      roleTitle: RoleType.student.value,
      roleType: RoleType.student,
      createTime: now,
      updateTime: now,
    ),
  ]);

  roleUserDao = database.roleUserDao;

  roleUserDao.insertRoleUser(RoleUser(
    id: 0,
    userID: 0,
    roleID: 0,
    createTime: now,
    updateTime: now,
  ));
}
