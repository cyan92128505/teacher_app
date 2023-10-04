import 'package:teacher/models/api_models.dart';

class TeacherService {
  TeacherService();

  Future<StatusHttpResponse> createTeacher(TeacherItem teacher) async {
    return const StatusHttpResponse();
  }

  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return const ListTeacherResponse();
  }
}
