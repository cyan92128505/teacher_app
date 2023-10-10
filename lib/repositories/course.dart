import 'package:teacher/database.dart';
import 'package:teacher/entities/entities.dart';
import 'package:teacher/models/api_models.dart';

abstract class CourseRepository {
  Future<CourseItem?> createCourse(CourseItem course) async {
    return course;
  }

  Future<CourseItem?> updateCourse(CourseItem course) async {
    return course;
  }

  Future<StatusHttpResponse> deleteCourse(String courseID) async {
    return const StatusHttpResponse();
  }

  Future<ListCourseResponse> getCourseList(ListCourseRequest request) async {
    return const ListCourseResponse();
  }

  Future<ListTeacherCourseResponse> getTeacherCourseList(
      ListTeacherCourseRequest request) async {
    return const ListTeacherCourseResponse();
  }
}

class LocalCourseRepository extends CourseRepository {
  @override
  Future<CourseItem?> createCourse(CourseItem course) async {
    final db = await DatabaseHelper().database;

    final user = await db.userDao.findUserById(course.teacherID);

    if (user == null) {
      return null;
    }

    final roleList = await db.roleUserDao.findAllRoleUserByUserIDAndRoleType(
      RoleType.lecturer,
      '${user.id}',
    );

    if (roleList.isEmpty) {
      return null;
    }

    final now = DateTime.now().toIso8601String();

    await db.courseDao.insertCourse(
      Course(
        updateTime: now,
        createTime: now,
        courseName: course.name,
        startAt: course.startAt,
        endAt: course.endAt,
        weekend: course.weekend,
        description: course.description,
        lecturerID: user.id!,
      ),
    );

    return course;
  }

  @override
  Future<CourseItem?> updateCourse(CourseItem course) async {
    return course;
  }

  @override
  Future<StatusHttpResponse> deleteCourse(String courseID) async {
    return const StatusHttpResponse();
  }

  @override
  Future<ListCourseResponse> getCourseList(ListCourseRequest request) async {
    return const ListCourseResponse();
  }

  @override
  Future<ListTeacherCourseResponse> getTeacherCourseList(
      ListTeacherCourseRequest request) async {
    return const ListTeacherCourseResponse();
  }
}

class HttpCourseRepository extends CourseRepository {
  @override
  Future<CourseItem?> createCourse(CourseItem course) async {
    return course;
  }

  @override
  Future<CourseItem?> updateCourse(CourseItem course) async {
    return course;
  }

  @override
  Future<StatusHttpResponse> deleteCourse(String courseID) async {
    return const StatusHttpResponse();
  }

  @override
  Future<ListCourseResponse> getCourseList(ListCourseRequest request) async {
    return const ListCourseResponse();
  }

  @override
  Future<ListTeacherCourseResponse> getTeacherCourseList(
      ListTeacherCourseRequest request) async {
    return const ListTeacherCourseResponse();
  }
}

class MockCourseRepository extends CourseRepository {
  final List<CourseItem> dataListCourse;
  final List<TeacherCourseItem> dataListTeacherCourseItem;

  MockCourseRepository({
    required this.dataListCourse,
    required this.dataListTeacherCourseItem,
  });

  @override
  Future<CourseItem?> createCourse(CourseItem course) async {
    return course;
  }

  @override
  Future<CourseItem?> updateCourse(CourseItem course) async {
    return course;
  }

  @override
  Future<StatusHttpResponse> deleteCourse(String courseID) async {
    return const StatusHttpResponse(code: 200, message: 'ok');
  }

  @override
  Future<ListCourseResponse> getCourseList(ListCourseRequest request) async {
    return ListCourseResponse(data: dataListCourse);
  }

  @override
  Future<ListTeacherCourseResponse> getTeacherCourseList(
      ListTeacherCourseRequest request) async {
    return ListTeacherCourseResponse(data: dataListTeacherCourseItem);
  }
}
