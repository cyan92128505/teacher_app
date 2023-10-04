class LecturerService {
  final LecturerRepository repository;

  LecturerService({
    required this.repository,
  });
}

abstract class LecturerRepository {
  createLecturer();
}
