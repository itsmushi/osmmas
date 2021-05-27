import 'package:flutter/material.dart';
import 'package:osmmas/widgets/page_title.dart';
import 'package:osmmas/widgets/result_year_of_study.dart';

class SubjectListScreen extends StatelessWidget {
  static const routeName = "subject-list";

  // SubjectListScreen(this.yearOfStudy);
  @override
  Widget build(BuildContext context) {
    final String yearOfStudy = ModalRoute.of(context).settings.arguments;
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
                PageTitle("SUBJECTS", false),
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
                    yearOfStudy,
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
                      Padding(
                        //for the average Results
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                            onTap: () {},
                            child: Text("Average Results",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                      ),
                      ResultYearOfStudy("Chemistry O-Level "),
                      Divider(),
                      ResultYearOfStudy("Physics O-Level"),
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
