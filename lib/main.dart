import 'package:flutter/material.dart';
import 'package:flutter_101/models/students_list_model.dart';
import 'package:flutter_101/screens/student_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentsListModel(students: []),
      builder: (_, __) => MaterialApp(
        home: const StudentsScreen(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
