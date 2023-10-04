import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_models.g.dart';
part 'api_models.freezed.dart';

@freezed
class StatusHttpResponse with _$StatusHttpResponse {
  const factory StatusHttpResponse({
    @Default('ok') @JsonKey(name: 'message') String message,
    @Default(200) @JsonKey(name: 'code') int code,
  }) = _StatusHttpResponse;

  factory StatusHttpResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusHttpResponseFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  static const int defaultRow = 20;

  const factory Pagination({
    @Default(0) @JsonKey(name: 'total') int total,
    @Default(Pagination.defaultRow) @JsonKey(name: 'row') int row,
    @Default(true) @JsonKey(name: 'descending') bool descending,
    @Default('') @JsonKey(name: 'next_cursor') String nextCursor,
    @Default('') @JsonKey(name: 'prev_cursor') String prevCursor,
    @Default(false) @JsonKey(name: 'has_next') bool hasNext,
    @Default(false) @JsonKey(name: 'has_prev') bool hasPrev,
  }) = Ppagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

@freezed
class TeacherItem with _$TeacherItem {
  const factory TeacherItem({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'user_id') String userID,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'type') String type,
    @Default('') @JsonKey(name: 'image_url') String imageURL,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TeacherItem;

  factory TeacherItem.fromJson(Map<String, dynamic> json) =>
      _$TeacherItemFromJson(json);
}

@freezed
class ListTeacherRequest with _$ListTeacherRequest {
  const factory ListTeacherRequest({
    @Default(20) @JsonKey(name: 'row') int row,
    @Default('') @JsonKey(name: 'cursor') String cursor,
    @Default(true) @JsonKey(name: 'descending') bool descending,
  }) = _ListTeacherRequest;

  factory ListTeacherRequest.fromJson(Map<String, dynamic> json) =>
      _$ListTeacherRequestFromJson(json);
}

@freezed
class ListTeacherResponse with _$ListTeacherResponse {
  const factory ListTeacherResponse({
    @Default(<TeacherItem>[]) @JsonKey(name: 'data') List<TeacherItem> data,
    @Default(null) @JsonKey(name: 'pagination') Pagination? pagination,
  }) = _ListTeacherResponse;

  factory ListTeacherResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTeacherResponseFromJson(json);
}

@freezed
class CourseItem with _$CourseItem {
  const factory CourseItem({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'start_at') String startAt,
    @Default('') @JsonKey(name: 'end_at') String endAt,
    @Default('') @JsonKey(name: 'weekend') String weekend,
    @Default('') @JsonKey(name: 'description') String description,
    @Default('') @JsonKey(name: 'teacher_id') String teacherID,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _CourseItem;

  factory CourseItem.fromJson(Map<String, dynamic> json) =>
      _$CourseItemFromJson(json);
}

@freezed
class ListCourseRequest with _$ListCourseRequest {
  const factory ListCourseRequest({
    @Default(20) @JsonKey(name: 'row') int row,
    @Default('') @JsonKey(name: 'cursor') String cursor,
    @Default(true) @JsonKey(name: 'descending') bool descending,
  }) = _ListCourseRequest;

  factory ListCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$ListCourseRequestFromJson(json);
}

@freezed
class ListCourseResponse with _$ListCourseResponse {
  const factory ListCourseResponse({
    @Default(<CourseItem>[]) @JsonKey(name: 'data') List<CourseItem> data,
    @Default(null) @JsonKey(name: 'pagination') Pagination? pagination,
  }) = _ListCourseResponse;

  factory ListCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCourseResponseFromJson(json);
}

@freezed
class TeacherCourseItem with _$TeacherCourseItem {
  const factory TeacherCourseItem({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'start_at') String startAt,
    @Default('') @JsonKey(name: 'end_at') String endAt,
    @Default('') @JsonKey(name: 'weekend') String weekend,
    @Default('') @JsonKey(name: 'description') String description,
    @Default(null) @JsonKey(name: 'teacher') TeacherItem? teacher,
  }) = _TeacherCourseItem;

  factory TeacherCourseItem.fromJson(Map<String, dynamic> json) =>
      _$TeacherCourseItemFromJson(json);
}

@freezed
class ListTeacherCourseRequest with _$ListTeacherCourseRequest {
  const factory ListTeacherCourseRequest({
    @Default(20) @JsonKey(name: 'row') int row,
    @Default('') @JsonKey(name: 'cursor') String cursor,
    @Default('') @JsonKey(name: 'teacher_id') String teacherID,
    @Default(true) @JsonKey(name: 'descending') bool descending,
  }) = _ListTeacherCourseRequest;

  factory ListTeacherCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$ListTeacherCourseRequestFromJson(json);
}

@freezed
class ListTeacherCourseResponse with _$ListTeacherCourseResponse {
  const factory ListTeacherCourseResponse({
    @Default(<TeacherCourseItem>[])
    @JsonKey(name: 'data')
    List<TeacherCourseItem> data,
    @Default(null) @JsonKey(name: 'pagination') Pagination? pagination,
  }) = _ListTeacherCourseResponse;

  factory ListTeacherCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTeacherCourseResponseFromJson(json);
}
