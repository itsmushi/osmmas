import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/event.dart';
import '../providers/dashboard.dart';
import 'package:osmmas/widgets/page_title.dart';

class DashboardScreen extends StatelessWidget {
  Future<void> _refreshDashboard(
    BuildContext context,
  ) async {
    await Provider.of<Dashboard>(context).fetchEvents();
  }

  bool firstTime = true;
  int count = 1;
  bool showLoading = true;

  List<Event> eventsData;
  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      _refreshDashboard(context).then((value) => {
            eventsData = Provider.of<Dashboard>(context, listen: false).events,
            showLoading = false,
            firstTime = false,
          });
    }

    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle("DASHBOARD", true),
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
                showLoading
                    ? Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [CircularProgressIndicator()],
                        ),
                      )
                    : DataTable(
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
                        //
                        rows: eventsData.map(
                          (e) {
                            count++;
                            return DataRow(cells: [
                              DataCell(Text(count.toString())),
                              DataCell(Text(e.date)),
                              DataCell(Text(e.event))
                            ]);
                          },
                        ).toList()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
