import 'package:flutter/material.dart';
import 'package:flutter_101/models/student_model.dart';
import 'package:flutter_101/models/students_list_model.dart';
import 'package:provider/provider.dart';

TextStyle kTextFieldStyle = const TextStyle(
  decorationColor: Colors.red,
  color: Colors.blueGrey,
);

class StudentForm extends StatefulWidget {
  final StudentModel? student;

  const StudentForm({Key? key, this.student}) : super(key: key);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  late bool isEditing;
  late TextEditingController nameController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    isEditing = false;
    nameController = TextEditingController();
    ageController = TextEditingController();

    if (widget.student != null) {
      isEditing = true;
      nameController.text = widget.student?.name ?? '';
      nameController.selection = TextSelection.fromPosition(
          TextPosition(offset: nameController.text.length));

      ageController.text = (widget.student?.age ?? 0).toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StudentsListModel students = Provider.of<StudentsListModel>(context);

    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              isEditing ? widget.student!.name : 'เพิ่มนักเรียน',
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'ชื่อ',
                focusColor: Colors.pink,
                labelStyle: kTextFieldStyle,
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.blueGrey,
                ),
                fillColor: Colors.blueGrey,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              controller: nameController,
              autofocus: true,
              autocorrect: false,
              style: kTextFieldStyle,
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'อายุ',
                focusColor: Colors.pink,
                labelStyle: kTextFieldStyle,
                icon: const Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.blueGrey,
                ),
                fillColor: Colors.blueGrey,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              controller: ageController,
              keyboardType: TextInputType.number,
              style: kTextFieldStyle,
            ),
            const SizedBox(height: 30),
            _buildButton(students),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(StudentsListModel students) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'ยกเลิก',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              color: Colors.blueGrey,
            ),
            minimumSize: const Size(150, 30),
          ),
        ),
        TextButton(
          onPressed: () {
            if (isEditing) {
              students.editStudent(
                StudentModel(
                  id: widget.student!.id,
                  name: nameController.text,
                  age: int.tryParse(ageController.text) ?? 0,
                ),
              );
            } else {
              students.addStudent(
                StudentModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text,
                  age: int.tryParse(ageController.text) ?? 0,
                ),
              );
            }

            Navigator.of(context).pop();
          },
          child: Text(
            isEditing ? 'แก้ไข' : 'เพิ่ม',
            style: const TextStyle(
              color: Color.fromARGB(255, 31, 126, 203),
              fontWeight: FontWeight.w900,
            ),
          ),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              color: Colors.pinkAccent,
            ),
            minimumSize: const Size(150, 30),
          ),
        ),
      ],
    );
  }
}
