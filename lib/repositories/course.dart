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
