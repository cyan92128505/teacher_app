import 'package:flutter/material.dart';
import 'package:teacher/components/course_tile.dart';
import 'package:teacher/models/models.dart';

class TeacherTile extends StatefulWidget {
  const TeacherTile({
    super.key,
    required this.teacher,
  });

  final TeacherInfo teacher;

  @override
  State<TeacherTile> createState() => _TeacherTileState();
}

class _TeacherTileState extends State<TeacherTile> {
  late bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1,
          color: Colors.black87,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 12,
            bottom: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  isOpen = !isOpen;
                  setState(() {});
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          widget.teacher.imageUrl,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.teacher.type.text,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.teacher.name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Icon(isOpen ? Icons.remove : Icons.add, size: 28),
                    )
                  ],
                ),
              ),
              if (isOpen) const Divider(),
              if (isOpen)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...widget.teacher.courses
                        .map(
                          (e) => CourseTile(
                            course: e,
                          ),
                        )
                        .toList()
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
