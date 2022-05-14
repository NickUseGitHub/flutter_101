import 'package:flutter/material.dart';
import 'package:flutter_101/models/student_model.dart';
import 'package:flutter_101/models/students_list_model.dart';
import 'package:flutter_101/widgets/no_data.dart';
import 'package:flutter_101/widgets/student_title.dart';
import 'package:provider/provider.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  late List<StudentModel> students;

  @override
  Widget build(BuildContext context) {
    StudentsListModel studentsListModel =
        Provider.of<StudentsListModel>(context);

    students = studentsListModel.students;

    return students.isEmpty
        ? const NoDataScreen(
            title: 'ยังไม่มีนักเรียน', details: 'กดปุ่ม + เพื่อเพิ่ม')
        : ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Dismissible(
                    key: Key(students[index].id),
                    child: StudentTitle(
                      student: students[index],
                    ),
                    background: Container(
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        studentsListModel.deleteStudent(students[index]);

                        students.removeAt(index);
                      }
                    },
                    direction: DismissDirection.endToStart,
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    indent: 20,
                    endIndent: 20,
                    height: 1,
                  ),
                ],
              );
            },
            itemCount: students.length,
          );
  }
}
