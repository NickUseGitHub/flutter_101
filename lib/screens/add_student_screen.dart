import 'package:flutter/material.dart';
import 'package:flutter_101/widgets/student_form.dart';

class AddStudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff747574),
      child: StudentForm(),
    );
  }
}
