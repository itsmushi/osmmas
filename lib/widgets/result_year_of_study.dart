import 'package:flutter/material.dart';
import 'package:osmmas/screens/subject_list_screen.dart';

class ResultYearOfStudy extends StatelessWidget {
  final String year;
  ResultYearOfStudy(this.year);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(SubjectListScreen.routeName, arguments: this.year);
          },
          child: Text(this.year, style: TextStyle(color: Colors.blue))),
    );
  }
}
