import 'package:floor/floor.dart';
import 'package:teacher/entities/base_object.dart';

@entity
class Course extends BaseObject {
  final String courseName;
  final String createdAt;
  final String startAt;
  final String endAt;
  final String weekend;
  final String description;
  final int lecturerID;

  Course({
    super.id,
    required super.updateTime,
    required super.createTime,
    required this.courseName,
    required this.createdAt,
    required this.startAt,
    required this.endAt,
    required this.weekend,
    required this.description,
    required this.lecturerID,
  });
}

@dao
abstract class CourseDao {
  @Query('SELECT * FROM Course')
  Future<List<Course>> findAllCourse();

  @insert
  Future<void> insertCourse(Course course);

  @insert
  Future<void> insertCourses(List<Course> courses);

  @update
  Future<void> updateCourse(Course course);

  @update
  Future<void> updateCourses(List<Course> course);

  @delete
  Future<void> deleteCourse(Course course);

  @delete
  Future<void> deleteCourses(List<Course> courses);
}
