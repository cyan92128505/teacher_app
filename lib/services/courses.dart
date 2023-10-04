import 'package:teacher/models/api_models.dart';

class CourseService {
  CourseService();

  Future<StatusHttpResponse> createCourse(CourseItem course) async {
    return const StatusHttpResponse();
  }

  Future<StatusHttpResponse> updateCourse(CourseItem course) async {
    return const StatusHttpResponse();
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
