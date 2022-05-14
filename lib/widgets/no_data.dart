import 'package:flutter/material.dart';

class NoDataScreen extends StatelessWidget {
  final String title;
  final String details;

  const NoDataScreen({Key? key, required this.title, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.orangeAccent,
            ),
          ),
          Text(
            details,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
