import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

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

TeacherListViewModel viewModel = TeacherListViewModel(
  teachers: [
    TeacherInfo(
      id: '1',
      type: TeacherEnum.professor,
      name: 'Albert',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
      courses: [
        CourseInfo(
          id: '1',
          name: '基礎程式設計',
          startAt: '10:00',
          endAt: '12:00',
          weekend: '每週二',
          description: '',
          teacherID: '1',
        ),
        CourseInfo(
          id: '1',
          name: '基礎程式設計',
          startAt: '10:00',
          endAt: '12:00',
          weekend: '每週二',
          description: '',
          teacherID: '1',
        ),
        CourseInfo(
          id: '1',
          name: '基礎程式設計',
          startAt: '10:00',
          endAt: '12:00',
          weekend: '每週二',
          description: '',
          teacherID: '1',
        ),
      ],
    ),
    TeacherInfo(
      id: '1',
      type: TeacherEnum.professor,
      name: 'Albert',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
      courses: [
        CourseInfo(
          id: '1',
          name: '基礎程式設計',
          startAt: '10:00',
          endAt: '12:00',
          weekend: '每週二',
          description: '',
          teacherID: '1',
        ),
      ],
    ),
    TeacherInfo(
      id: '1',
      type: TeacherEnum.professor,
      name: 'Albert',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
      courses: [
        CourseInfo(
          id: '1',
          name: '基礎程式設計',
          startAt: '10:00',
          endAt: '12:00',
          weekend: '每週二',
          description: '',
          teacherID: '1',
        )
      ],
    ),
  ],
);

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'user_name') String userName,
    @Default('') @JsonKey(name: 'password') String password,
    @Default(null) @JsonKey(name: 'created_at') DateTime createdAt,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}

enum RoleType {
  student,
  lecturer;

  String get value => switch (this) {
        RoleType.student => 'student',
        RoleType.lecturer => 'lecturer',
      };
}

@freezed
class RoleDTO with _$RoleDTO {
  const factory RoleDTO({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'role_name') String roleName,
    @Default('student') @JsonKey(name: 'role_type') String roleType,
    @Default(null) @JsonKey(name: 'created_at') DateTime createdAt,
  }) = _RoleDTO;

  factory RoleDTO.fromJson(Map<String, dynamic> json) =>
      _$RoleDTOFromJson(json);
}

@freezed
class RoleUserDTO with _$RoleUserDTO {
  const factory RoleUserDTO({
    @Default('') @JsonKey(name: 'role_id') String roleID,
    @Default('') @JsonKey(name: 'user_id') String userID,
    @Default(null) @JsonKey(name: 'created_at') DateTime createdAt,
  }) = _RoleUserDTO;

  factory RoleUserDTO.fromJson(Map<String, dynamic> json) =>
      _$RoleUserDTOFromJson(json);
}

@freezed
class CourseDTO with _$CourseDTO {
  const factory CourseDTO({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'course_name') String courseName,
    @Default(null) @JsonKey(name: 'created_at') DateTime createdAt,
    @Default('00:00') @JsonKey(name: 'start_at') String startAt,
    @Default('23:59') @JsonKey(name: 'end_at') String endAt,
    @Default('') @JsonKey(name: 'weekend') String weekend,
    @Default('') @JsonKey(name: 'description') String description,
    @Default('') @JsonKey(name: 'lecturer_id') String lecturerID,
  }) = _CourseDTO;

  factory CourseDTO.fromJson(Map<String, dynamic> json) =>
      _$CourseDTOFromJson(json);
}

@freezed
class CourseUserDTO with _$CourseUserDTO {
  const factory CourseUserDTO({
    @Default('') @JsonKey(name: 'course_id') String courseID,
    @Default('') @JsonKey(name: 'user_id') String userID,
    @Default(null) @JsonKey(name: 'created_at') DateTime createdAt,
  }) = _CourseUserDTO;

  factory CourseUserDTO.fromJson(Map<String, dynamic> json) =>
      _$CourseUserDTOFromJson(json);
}
