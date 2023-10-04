import 'package:teacher/models/api_models.dart';

abstract class CourseRepository {
  Future<StatusHttpResponse> createCourse(CourseItem course) async {
    return const StatusHttpResponse();
  }

  Future<StatusHttpResponse> updateCourse(CourseItem course) async {
    return const StatusHttpResponse();
  }

  Future<StatusHttpResponse> deleteCourse(CourseItem course) async {
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
  Future<StatusHttpResponse> createCourse(CourseItem course) async {
    return const StatusHttpResponse();
  }

  @override
  Future<StatusHttpResponse> updateCourse(CourseItem course) async {
    return const StatusHttpResponse();
  }

  @override
  Future<StatusHttpResponse> deleteCourse(CourseItem course) async {
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
