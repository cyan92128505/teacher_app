import 'package:flutter_test/flutter_test.dart';
import 'package:teacher/database.dart';
import 'package:teacher/entities/entities.dart';
import 'package:teacher/utils/password.dart';

void main() {
  late AppDatabase database;
  late UserDao userDao;
  late RoleDao roleDao;
  late RoleUserDao roleUserDao;
  late CourseDao courseDao;

  setUpAll(() async {
    database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    final now = DateTime.now().toIso8601String();
    userDao = database.userDao;
    userDao.insertUsers([
      User(
        id: 0,
        userName: 'Teacher 1',
        passwordHash: generatePassword('ABCD1234'),
        imageUrl: 'https://i.pravatar.cc/150?img=1',
        createTime: now,
        updateTime: now,
      ),
      User(
        id: 1,
        userName: 'Student 1',
        passwordHash: generatePassword('ABCD1234'),
        imageUrl: 'https://i.pravatar.cc/150?img=1',
        createTime: now,
        updateTime: now,
      ),
    ]);

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
    roleUserDao.insertRoleUsers([
      RoleUser(
        id: 0,
        userID: 0,
        roleID: 0,
        createTime: now,
        updateTime: now,
      ),
      RoleUser(
        id: 1,
        userID: 1,
        roleID: 1,
        createTime: now,
        updateTime: now,
      )
    ]);

    courseDao = database.courseDao;
    courseDao.insertCourse(Course(
      id: 0,
      courseName: '課程一',
      startAt: '10:00',
      endAt: '12:00',
      weekend: '一',
      description: '',
      updateTime: now,
      createTime: now,
      lecturerID: 0,
    ));
  });

  tearDownAll(() async {
    await database.close();
  });

  testWidgets('Test Add Course', (tester) async {
    await tester.runAsync(() async {
      final user = await userDao.findUserById('0');
      final now = DateTime.now().toIso8601String();

      courseDao.insertCourse(Course(
        courseName: '課程二',
        startAt: '10:00',
        endAt: '12:00',
        weekend: '二',
        description: '',
        updateTime: now,
        createTime: now,
        lecturerID: user!.id!,
      ));

      final list = await courseDao.findAllCourse();

      expect(list.length, 2);
    });
  });

  testWidgets('Test Update Course', (tester) async {
    await tester.runAsync(() async {
      final course = await courseDao.findCourseByID('0');

      courseDao.updateCourse(course!.copyWith(
        startAt: '08:00',
        endAt: '10:00',
      ));

      final modifyCourse = await courseDao.findCourseByID('0');

      expect(modifyCourse!.startAt, '08:00');
      expect(modifyCourse.endAt, '10:00');
    });
  });

  testWidgets('Test Delete Course', (tester) async {
    await tester.runAsync(() async {
      final course = await courseDao.findCourseByID('0');

      courseDao.deleteCourse(course!);

      final actualList = await courseDao.findAllCourse();

      expect(actualList, isEmpty);
    });
  });

  testWidgets('Test Get All Course', (tester) async {
    await tester.runAsync(() async {
      final actualList = await courseDao.findCoursesByLecturerID('0');

      expect(actualList, isNotEmpty);
    });
  });
}
