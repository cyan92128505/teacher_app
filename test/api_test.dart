// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:teacher/models/api_models.dart';
import 'package:teacher/repositories/course.dart';
import 'package:teacher/repositories/techer.dart';
import 'package:teacher/services/courses.dart';
import 'package:teacher/services/teacher.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  List<TeacherItem> dataListTeacher = [
    TeacherItem(
      id: '1',
      name: 'Teacher 1',
    )
  ];

  List<CourseItem> dataListCourse = [
    CourseItem(
      id: '1',
      name: 'Course 1',
    ),
  ];

  List<TeacherCourseItem> dataListTeacherCourseItem = [
    TeacherCourseItem(
      id: '1',
      name: 'Course 1',
      teacher: TeacherItem(
        id: '1',
        name: 'Teacher 1',
      ),
    )
  ];

  TeacherRepository teacherRepository = MockTeacherRepository(
    dataListTeacher: dataListTeacher,
  );

  CourseRepository courseRepository = MockCourseRepository(
    dataListCourse: dataListCourse,
    dataListTeacherCourseItem: dataListTeacherCourseItem,
  );

  group(
    'Teacher Tests',
    () {
      test(
        'Test Create A Teacher',
        () async {
          final service = TeacherService(teacherRepository);
          final actual = TeacherItem(
            id: '1',
            name: 'Teacher 1',
          );

          final result = await service.createTeacher(actual);

          if (result != null) {
            expect(result.id, actual.id);
            expect(result.name, actual.name);
          }
        },
      );

      test(
        'Test Get Teacher List',
        () async {
          final service = TeacherService(teacherRepository);

          final result = await service.getTeacherList(ListTeacherRequest());

          expect(result.data.length, dataListTeacher.length);
        },
      );
    },
  );

  group(
    'Course Tests',
    () {
      test(
        'Test Create A Course',
        () async {
          final service = CourseService(courseRepository);
          final actual = CourseItem(id: '1', name: 'Course 1');

          final result = await service.createCourse(actual);

          if (result != null) {
            expect(result.id, actual.id);
            expect(result.name, actual.name);
          }
        },
      );

      test(
        'Test Update A Course',
        () async {
          final service = CourseService(courseRepository);
          final actual = CourseItem(id: '1', name: 'Course 2');

          final result = await service.updateCourse(actual);

          if (result != null) {
            expect(result.id, actual.id);
            expect(result.name, actual.name);
          }
        },
      );

      test(
        'Test Delete A Course',
        () async {
          final service = CourseService(courseRepository);
          final actual = CourseItem(id: '1', name: 'Course 2');

          final result = await service.deleteCourse(actual.id);

          expect(result.code, 200);
        },
      );

      test(
        'Test Get Course List',
        () async {
          final service = CourseService(courseRepository);

          final result = await service.getCourseList(ListCourseRequest());

          expect(result.data.length, dataListCourse.length);
        },
      );

      test(
        'Test Get Course List By Teacher ID',
        () async {
          final service = CourseService(courseRepository);

          final result = await service
              .getTeacherCourseList(ListTeacherCourseRequest(teacherID: '1'));

          expect(result.data.length, dataListTeacherCourseItem.length);
        },
      );
    },
  );
}
