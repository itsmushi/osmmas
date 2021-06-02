import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:osmmas/models/month_result.dart';
import 'package:osmmas/providers/subject_result.dart';
import 'package:provider/provider.dart';
import 'package:osmmas/widgets/page_title.dart';

class SubjectResultsScreen extends StatelessWidget {
  static const routeName = "subject-results";

  Future<void> _refreshResultList(
      BuildContext context, String year, String code) async {
    await Provider.of<SubjectResult>(context).fetchResults(year, code);
  }

  bool firstTime = true;
  bool showLoading = true;
  List<MonthResult> resultsData;

  @override
  Widget build(BuildContext context) {
    //   // final subjectName = ModalRoute.of(context).settings.arguments;
    //  final  subjectName="dfs";
    List<String> argmentList = ModalRoute.of(context).settings.arguments;

    print(argmentList[1]);

    if (firstTime) {
      _refreshResultList(context, argmentList[1], argmentList[2]).then(
        (value) => {
          resultsData =
              Provider.of<SubjectResult>(context, listen: false).results,
          showLoading = false,
          firstTime = false,
          print("resultsData.length"),
          print(resultsData.length),
          print(resultsData),
        },
      );
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
                PageTitle(argmentList[0], false),
              ],
            ),
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataTable(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 254, 254, 1)),
                      columns: [
                        DataColumn(
                          label: Text(
                            "#",
                            style: TextStyle(
                              color: Color.fromRGBO(104, 138, 126, 1),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text("Month",
                              style: TextStyle(
                                color: Color.fromRGBO(104, 138, 126, 1),
                                fontSize: 16,
                              )),
                        ),
                        DataColumn(
                          label: Text("Marks",
                              style: TextStyle(
                                color: Color.fromRGBO(104, 138, 126, 1),
                                fontSize: 16,
                              )),
                        ),
                        DataColumn(
                          label: Text("Grade",
                              style: TextStyle(
                                color: Color.fromRGBO(104, 138, 126, 1),
                                fontSize: 16,
                              )),
                        )
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("January"),
                          ),
                          DataCell(
                            Text("67"),
                          ),
                          DataCell(
                            Text("B"),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("January"),
                          ),
                          DataCell(
                            Text("67"),
                          ),
                          DataCell(
                            Text("B"),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text("1"),
                          ),
                          DataCell(
                            Text("January"),
                          ),
                          DataCell(
                            Text("67"),
                          ),
                          DataCell(
                            Text("B"),
                          )
                        ])
                      ])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
