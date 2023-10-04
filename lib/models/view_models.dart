enum TeacherEnum {
  demonstrator,
  lecturer,
  seniorLecturer,
  professor;

  String get text => switch (this) {
        TeacherEnum.demonstrator => 'Demonstrator',
        TeacherEnum.lecturer => 'Lecturer',
        TeacherEnum.seniorLecturer => 'Senior Lecturer',
        TeacherEnum.professor => 'Professor',
      };
}

class CourseInfo {
  final String id;
  final String name;
  final String startAt;
  final String endAt;
  final String weekend;
  final String description;
  final String teacherID;

  CourseInfo({
    required this.id,
    required this.name,
    required this.startAt,
    required this.endAt,
    required this.weekend,
    required this.description,
    required this.teacherID,
  });

  String get timeRangeInfoText => '$weekend,$startAt-$endAt';
}

class TeacherInfo {
  final String id;
  final TeacherEnum type;
  final String name;
  final String imageUrl;
  final List<CourseInfo> courses;

  TeacherInfo({
    required this.id,
    required this.type,
    required this.name,
    required this.imageUrl,
    required this.courses,
  });
}

class TeacherListViewModel {
  final List<TeacherInfo> teachers;

  TeacherListViewModel({required this.teachers});
}
