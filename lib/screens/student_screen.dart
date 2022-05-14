// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_101/models/students_list_model.dart';
import 'package:flutter_101/screens/add_student_screen.dart';
import 'package:flutter_101/widgets/students_list.dart';
import 'package:provider/provider.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  @override
  Widget build(BuildContext context) {
    StudentsListModel students = Provider.of<StudentsListModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    child: Icon(
                      Icons.people_alt,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.pink,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'รายชื่อนักเรียน',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade400,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'นักเรียนทั้งหมด ${students.students.length} คน',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: StudentList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.pinkAccent,
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddStudentScreen(),
          ),
        },
      ),
    );
  }
}
