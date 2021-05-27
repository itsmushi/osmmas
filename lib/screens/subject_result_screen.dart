import 'package:flutter/material.dart';
import 'package:osmmas/widgets/page_title.dart';

class SubjectResultsScreen extends StatelessWidget {
  static const routeName = "subject-results";
  @override
  Widget build(BuildContext context) {
    final subjectName = ModalRoute.of(context).settings.arguments;
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
                PageTitle(subjectName, false),
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
