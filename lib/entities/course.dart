import 'package:floor/floor.dart';
import 'package:teacher/entities/base_object.dart';

@entity
class Course extends BaseObject {
  final String courseName;
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
    required this.startAt,
    required this.endAt,
    required this.weekend,
    required this.description,
    required this.lecturerID,
  });

  Course copyWith({
    int? id,
    String? updateTime,
    String? createTime,
    String? courseName,
    String? startAt,
    String? endAt,
    String? weekend,
    String? description,
    int? lecturerID,
  }) {
    return Course(
      id: id ?? this.id,
      updateTime: updateTime ?? this.updateTime,
      createTime: createTime ?? this.createTime,
      courseName: courseName ?? this.courseName,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      weekend: weekend ?? this.weekend,
      description: description ?? this.description,
      lecturerID: lecturerID ?? this.lecturerID,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Course &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          updateTime == other.updateTime &&
          createTime == other.createTime &&
          courseName == other.courseName &&
          startAt == other.startAt &&
          endAt == other.endAt &&
          weekend == other.weekend &&
          description == other.description &&
          lecturerID == other.lecturerID;

  @override
  int get hashCode =>
      id.hashCode ^
      updateTime.hashCode ^
      createTime.hashCode ^
      courseName.hashCode ^
      startAt.hashCode ^
      endAt.hashCode ^
      weekend.hashCode ^
      description.hashCode ^
      lecturerID.hashCode;
}

@dao
abstract class CourseDao {
  @Query('SELECT * FROM Course')
  Future<List<Course>> findAllCourse();

  @Query('SELECT * FROM Course WHERE id = :id')
  Future<Course?> findCourseByID(String id);

  @Query('''
SELECT * FROM Course 
WHERE lecturerID = :lecturerID
''')
  Future<List<Course>> findCoursesByLecturerID(String lecturerID);

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
