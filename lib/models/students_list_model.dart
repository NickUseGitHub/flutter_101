import 'package:flutter/material.dart';
import 'package:flutter_101/models/student_model.dart';

class StudentsListModel extends ChangeNotifier {
  List<StudentModel> students;

  StudentsListModel({required this.students});

  void addStudent(StudentModel newStudent) {
    students.insert(0, newStudent);
    notifyListeners();
  }

  void editStudent(StudentModel editedStudent) {
    var index =
        students.indexWhere((student) => student.id == editedStudent.id);

    if (index != -1) {
      students[index] = StudentModel(
        id: students[index].id,
        name: editedStudent.name,
        age: editedStudent.age,
      );

      notifyListeners();
    }
  }

  void deleteStudent(StudentModel deletedStudent) {
    students.map((student) => student.id != deletedStudent.id).toList();

    notifyListeners();
  }
}
