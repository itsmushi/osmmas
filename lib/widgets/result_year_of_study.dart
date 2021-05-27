import 'package:flutter/material.dart';
import 'package:osmmas/screens/subject_list_screen.dart';
import 'package:osmmas/screens/subject_result_screen.dart';

class ResultYearOfStudy extends StatelessWidget {
  final String year;
  final String subject;
  ResultYearOfStudy(
      {this.year,
      this.subject}); //if subject is set the go the result page otherwise year is set go to subject list
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
          onTap: () {
            //if subject is set the go the result page otherwise year is set go to subject list
            subject == null
                ? Navigator.of(context).pushNamed(SubjectListScreen.routeName,
                    arguments: this.year)
                : Navigator.of(context)
                    .pushNamed(SubjectResultsScreen.routeName,arguments: subject);
          },
          child: Text(this.year, style: TextStyle(color: Colors.blue))),
    );
  }
}
