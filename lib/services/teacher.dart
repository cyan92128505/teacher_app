import 'package:teacher/models/api_models.dart';
import 'package:teacher/repositories/techer.dart';

class TeacherService {
  final TeacherRepository repository;
  TeacherService(this.repository);

  /// 建立新講師 API (Create)
  Future<TeacherItem?> createTeacher(TeacherItem teacher) async {
    final response = await repository.createTeacher(teacher);
    return response;
  }

  /// 課程列表 API (Read)
  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    final response = await repository.getTeacherList(request);
    return response;
  }
}
