import 'package:flutter/material.dart';
import 'package:osmmas/screens/announcement_screen.dart';
import 'package:osmmas/screens/login.dart';
import 'package:osmmas/screens/student_info_sreen.dart';
import 'package:osmmas/screens/suggestion_screen.dart';

import '../screens/reports_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // color: Colors.lightBlue,
        child: Column(
          children: [
            AppBar(
              title: Text("Osmmas"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Dashboard"),
              onTap: () {
                // Navigator.pushReplacementNamed(context, ),
              },
            ),
            Divider(),
            ListTile(
              title: Text("Annoucement"),onTap: () {
                Navigator.pushNamed(context,AnnouncementScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Payment"),
              onTap: (){
                Navigator.pushNamed(context,LoginScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Reports"),
              onTap: () {
                Navigator.pushNamed(context, ReportScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Suggestion"),
              onTap: () {
                Navigator.pushNamed(context, SuggestionScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Student Info"),
              onTap: () {
                Navigator.of(context).pushNamed(StudentInfoScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Change Password"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Log Out"),
            )
          ],
        ),
      ),
    );
  }
}
