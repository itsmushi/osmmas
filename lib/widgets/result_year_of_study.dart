import 'package:flutter/material.dart';

class ResultYearOfStudy extends StatelessWidget {
  final String year;
  ResultYearOfStudy(this.year);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
          onTap: () {},
          child: Text(this.year, style: TextStyle(color: Colors.blue))),
    );
  }
}
