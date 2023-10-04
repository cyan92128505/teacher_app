class CourseService {
  final CourseRepository repository;

  CourseService({
    required this.repository,
  });
}

abstract class CourseRepository {}
