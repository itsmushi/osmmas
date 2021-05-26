import 'package:flutter/material.dart';

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
              title: Text("Annoucement"),
            ),
            Divider(),
            ListTile(
              title: Text("Payment"),
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
            ),
            Divider(),
            ListTile(
              title: Text("Student Info"),
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
