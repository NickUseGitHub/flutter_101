import 'package:flutter/material.dart';
import 'package:flutter_101/models/student_model.dart';
import 'package:flutter_101/screens/edit_student_screen.dart';

TextStyle kTextStyle = const TextStyle(
  color: Colors.pinkAccent,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

class StudentTitle extends StatelessWidget {
  final StudentModel student;

  const StudentTitle({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 60,
        right: 60,
        top: 0,
        bottom: 0,
      ),
      title: Text(
        student.name,
        style: kTextStyle,
      ),
      trailing: Text(
        student.age.toString(),
        style: kTextStyle,
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => EditStudentScreen(student: student),
        );
      },
    );
  }
}
