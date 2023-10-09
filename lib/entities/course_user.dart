import 'package:floor/floor.dart';
import 'package:teacher/entities/base_object.dart';

@entity
class CourseUser extends BaseObject {
  @primaryKey
  final int courseID;
  @primaryKey
  final int userID;
  final String createdAt;

  CourseUser({
    super.id,
    required super.updateTime,
    required super.createTime,
    required this.courseID,
    required this.userID,
    required this.createdAt,
  });
}

@dao
abstract class CourseUserDao {
  @Query('SELECT * FROM CourseUser')
  Future<List<CourseUser>> findAllCourseUser();

  @insert
  Future<void> insertCourseUser(CourseUser courseUser);

  @insert
  Future<void> insertCourseUsers(List<CourseUser> courseUsers);

  @update
  Future<void> updateCourseUser(CourseUser courseUser);

  @update
  Future<void> updateCourseUsers(List<CourseUser> courseUser);

  @delete
  Future<void> deleteCourseUser(CourseUser courseUser);

  @delete
  Future<void> deleteCourseUsers(List<CourseUser> courseUsers);
}
