import 'package:flutter/material.dart';
import 'package:osmmas/widgets/page_title.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle("DASHBOARD"),
            ],
          ),
        ),
        Card(
          elevation: 8,
          margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  color: Color.fromRGBO(245, 245, 245, 1.0),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Main Events",
                    style: TextStyle(fontSize: 16),
                  ),
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
                        label: Text("Date",
                            style: TextStyle(
                              color: Color.fromRGBO(104, 138, 126, 1),
                              fontSize: 16,
                            )),
                      ),
                      DataColumn(
                        label: Text("Event",
                            style: TextStyle(
                              color: Color.fromRGBO(104, 138, 126, 1),
                              fontSize: 16,
                            )),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(
                          Text("1"),
                        ),
                        DataCell(
                          Text("2021-04-21"),
                        ),
                        DataCell(
                          Text("System check"),
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
