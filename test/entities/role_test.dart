import 'package:flutter_test/flutter_test.dart';
import 'package:teacher/database.dart';
import 'package:teacher/entities/entities.dart';

void main() {
  late AppDatabase database;
  late RoleDao roleDao;

  setUpAll(() async {
    database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    final now = DateTime.now().toIso8601String();

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
  });

  tearDownAll(() async {
    await database.close();
  });

  testWidgets('Find Role:lecturer', (tester) async {
    await tester.runAsync(() async {
      final role = await roleDao.findRoleByType(RoleType.lecturer);
      expect(role!.roleName, RoleType.lecturer.value);
    });
  });
}
