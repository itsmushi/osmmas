import 'package:flutter/material.dart';

import 'package:osmmas/providers/subject_list.dart';
import 'package:osmmas/screens/average_result_screen.dart';
import 'package:osmmas/screens/subject_result_screen.dart';

import '../models/subject.dart';

import 'package:osmmas/widgets/loading_bar.dart';
import 'package:osmmas/widgets/page_title.dart';
import 'package:osmmas/widgets/result_year_of_study.dart';
import 'package:provider/provider.dart';

class SubjectListScreen extends StatelessWidget {
  static const routeName = "subject-list";

  Future<void> _refreshSubjectList(BuildContext context, String year) async {
    await Provider.of<SubjectList>(context).fetchSubjects(year);
  }

  bool firstTime = true;
  bool showLoading = true;
  List<Subject> subjectData;

  List<Widget> subjectListWidgets = [];

  @override
  Widget build(BuildContext context) {
    final String yearOfStudy = ModalRoute.of(context).settings.arguments;
    if (firstTime) {
      _refreshSubjectList(context, yearOfStudy).then((value) => {
            subjectData =
                Provider.of<SubjectList>(context, listen: false).subjects,
            showLoading = false,
            firstTime = false,
          });
    }
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
                showLoading
                    ? LoadingBar()
                    : buildSubjectListWidget(context, yearOfStudy),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSubjectListWidget(BuildContext context, String yearOfStudy) {
    subjectListWidgets.add(Padding(
      //for the average Results
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AverageResultsScreen.routeName);
          },
          child: Text("Average Results",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))),
    ));
    subjectData.forEach((element) {
      subjectListWidgets.add(Divider());
      subjectListWidgets.add(ResultYearOfStudy(
          year: yearOfStudy,
          subject: element.subjectName,
          subjectCode: element.subjectOf));
    });

    return SingleChildScrollView(
      child: Container(
        height: 300,
        child: ListView(
          children: subjectListWidgets,
        ),
      ),
    );
  }
}
