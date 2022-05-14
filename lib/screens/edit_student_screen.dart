import 'package:flutter/material.dart';
import 'package:flutter_101/models/student_model.dart';
import 'package:flutter_101/widgets/student_form.dart';

class EditStudentScreen extends StatelessWidget {
  late StudentModel student;

  EditStudentScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff747574),
      child: StudentForm(student: student),
    );
  }
}
