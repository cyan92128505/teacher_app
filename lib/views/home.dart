import 'package:flutter/material.dart';
import 'package:teacher/components/teacher_tile.dart';
import 'package:teacher/models/models.dart';

class TeacherListPage extends StatelessWidget {
  const TeacherListPage({
    super.key,
    required this.viewModel,
  });

  final TeacherListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          '講師清單',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: viewModel.teachers
                    .map(
                      (teacher) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TeacherTile(teacher: teacher),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
