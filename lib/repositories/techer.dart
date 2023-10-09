import 'package:teacher/database.dart';
import 'package:teacher/entities/entities.dart';
import 'package:teacher/models/api_models.dart';

abstract class TeacherRepository {
  Future<TeacherItem?> createTeacher(TeacherItem teacher) async {
    return teacher;
  }

  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return const ListTeacherResponse();
  }
}

class LocalTeacherRepository extends TeacherRepository {
  @override
  Future<TeacherItem?> createTeacher(TeacherItem teacher) async {
    final db = await DatabaseHelper().database;
    final user = await db.userDao.findUserById(teacher.id);
    final role = await db.roleDao.findRoleByType(RoleType.lecturer);

    if (user == null || role == null) {
      return null;
    }

    final roleUser = RoleUser(
      updateTime: DateTime.now().toIso8601String(),
      createTime: DateTime.now().toIso8601String(),
      userID: user.id!,
      roleID: role.id!,
    );

    await db.roleUserDao.insertRoleUser(roleUser);
    return teacher;
  }

  @override
  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    final db = await DatabaseHelper().database;
    final users = await db.userDao.findUserByRoleType(RoleType.lecturer);

    if (users.isEmpty) {
      return const ListTeacherResponse().copyWith(
        pagination: const Pagination(
          hasNext: false,
        ),
      );
    }

    final roleUsers =
        await db.roleUserDao.findUserByRoleType(RoleType.lecturer);

    return ListTeacherResponse(
      data: users.map((user) {
        final roleUserId =
            roleUsers.where((ru) => ru.userID == user.id).first.id;

        return TeacherItem(
          id: '$roleUserId',
          userID: '$user.id',
          name: user.userName,
          type: RoleType.lecturer.value,
          imageURL: user.imageUrl,
          createdAt: DateTime.parse(user.createTime),
        );
      }).toList(),
      pagination: const Pagination(
        hasNext: false,
      ),
    );
  }
}

class HttpTeacherRepository extends TeacherRepository {
  @override
  Future<TeacherItem?> createTeacher(TeacherItem teacher) async {
    return teacher;
  }

  @override
  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return const ListTeacherResponse();
  }
}

class MockTeacherRepository extends TeacherRepository {
  final List<TeacherItem> dataListTeacher;

  MockTeacherRepository({
    required this.dataListTeacher,
  });

  @override
  Future<TeacherItem?> createTeacher(TeacherItem teacher) async {
    return teacher;
  }

  @override
  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return ListTeacherResponse(
      data: dataListTeacher,
    );
  }
}
