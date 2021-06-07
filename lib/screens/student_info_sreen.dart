import 'package:flutter/material.dart';
import 'package:osmmas/models/student.dart';
import 'package:osmmas/providers/student_info_provider.dart';
import 'package:osmmas/widgets/page_title.dart';
import 'package:provider/provider.dart';

class StudentInfoScreen extends StatelessWidget {
  static const String routeName = 'student-info';

  Future<void> _refreshInfo(
    BuildContext context,
  ) async {
    await Provider.of<StudentInfoProvider>(context).getStudentInfo();
  }

  bool firstTime = true;
  int count = 1;
  bool showLoading = true;
  Student studentData;

  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      _refreshInfo(context).then((value) => {
            studentData =
                Provider.of<StudentInfoProvider>(context, listen: false)
                    .student,
            showLoading = false,
            firstTime = false,
          });
      print("st");
      print(studentData);
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
                PageTitle("STUDENT INFO", false),
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
                          label: Text("Info",
                              style: TextStyle(
                                color: Color.fromRGBO(104, 138, 126, 1),
                                fontSize: 16,
                              )),
                        ),
                        DataColumn(
                          label: Text("Value",
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
                            Text("Name"),
                          ),
                          DataCell(
                            Text("Some Name"),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text("2"),
                          ),
                          DataCell(
                            Text("Parent Name"),
                          ),
                          DataCell(
                            Text("System check"),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text("3"),
                          ),
                          DataCell(
                            Text("Phone Number"),
                          ),
                          DataCell(
                            Text("07248923"),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text("4"),
                          ),
                          DataCell(
                            Text("email"),
                          ),
                          DataCell(
                            Text("some@gmail.com"),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text("5"),
                          ),
                          DataCell(
                            Text("username"),
                          ),
                          DataCell(
                            Text("S044/42/P3/23"),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text("6"),
                          ),
                          DataCell(
                            Text("ID number"),
                          ),
                          DataCell(
                            Text("112"),
                          )
                        ])
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
