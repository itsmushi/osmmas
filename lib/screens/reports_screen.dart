import 'package:flutter/material.dart';
import 'package:osmmas/widgets/page_title.dart';
import 'package:osmmas/widgets/result_year_of_study.dart';

class ReportScreen extends StatelessWidget {
  static const routeName = "reports";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle("YEAR OF STUDY"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  color: Color.fromRGBO(245, 245, 245, 1.0),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Year of study",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(104, 138, 126, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView(
                    children: [
                      ResultYearOfStudy("2020"),
                      Divider(),
                      ResultYearOfStudy("2021"),
                      Divider()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
