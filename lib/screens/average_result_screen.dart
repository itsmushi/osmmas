import 'package:flutter/material.dart';
import 'package:osmmas/widgets/page_title.dart';

class AverageResultsScreen extends StatelessWidget {
  static const String routeName='average-results';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle("AVERAGE", false),
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
                Container(
                  alignment: Alignment.topLeft,
                ),
                DataTable(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(255, 254, 254, 1)),
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
                        label: Text("Subject Name",
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
                          Text("Kiswahili O-Level"),
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
                          Text("Kiswahili O-Level"),
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
                          Text("Kiswahili O-Level"),
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
    );
  }
}
