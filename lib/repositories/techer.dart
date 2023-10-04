import 'package:teacher/models/api_models.dart';

abstract class TeacherRepository {
  Future<TeacherItem?> createTeacher(TeacherItem teacher) async {
    return teacher;
  }

  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return const ListTeacherResponse();
  }
}

class HttpTeacherRepository extends TeacherRepository {
  @override
  Future<TeacherItem?> createTeacher(TeacherItem teacher) async {
    return teacher;
  }

  @override
  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return const ListTeacherResponse();
  }
}

class MockTeacherRepository extends TeacherRepository {
  final List<TeacherItem> dataListTeacher;

  MockTeacherRepository({
    required this.dataListTeacher,
  });

  @override
  Future<TeacherItem?> createTeacher(TeacherItem teacher) async {
    return teacher;
  }

  @override
  Future<ListTeacherResponse> getTeacherList(ListTeacherRequest request) async {
    return ListTeacherResponse(
      data: dataListTeacher,
    );
  }
}
