import 'package:teacher/models/api_models.dart';

abstract class TeacherRepository {
  Future<StatusHttpResponse> createTeacher(TeacherItem teacher) async {
    return const StatusHttpResponse();
  }

  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return const ListTeacherResponse();
  }
}

class HttpTeacherRepository extends TeacherRepository {
  @override
  Future<StatusHttpResponse> createTeacher(TeacherItem teacher) async {
    return const StatusHttpResponse();
  }

  @override
  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return const ListTeacherResponse();
  }
}
