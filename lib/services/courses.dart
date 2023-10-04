import 'package:teacher/models/api_models.dart';
import 'package:teacher/repositories/course.dart';

class CourseService {
  final CourseRepository repository;
  CourseService(this.repository);

  /// 建立新課程 API (Create)
  Future<CourseItem?> createCourse(CourseItem course) async {
    final response = repository.createCourse(course);
    return response;
  }

  /// 更新課程內容 API (Update)
  Future<CourseItem?> updateCourse(CourseItem course) async {
    final response = repository.updateCourse(course);
    return response;
  }

  /// 刪除課程 API (Delete)
  Future<StatusHttpResponse> deleteCourse(String courseID) async {
    final response = repository.deleteCourse(courseID);
    return response;
  }

  /// 課程列表 API (Read
  Future<ListCourseResponse> getCourseList(ListCourseRequest request) async {
    final response = repository.getCourseList(request);
    return response;
  }

  /// 授課講師所開課程列表 API (Read)
  Future<ListTeacherCourseResponse> getTeacherCourseList(
      ListTeacherCourseRequest request) async {
    final response = repository.getTeacherCourseList(request);
    return response;
  }
}
