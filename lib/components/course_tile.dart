import 'package:flutter/material.dart';
import 'package:teacher/models/models.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    required this.course,
  });
  final CourseInfo course;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.calendar_month_outlined,
        size: 26,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(course.name),
          Text(course.timeRangeInfoText),
        ],
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        weight: 34,
        size: 16,
      ),
    );
  }
}
