import 'package:flutter/material.dart';
import 'package:osmmas/widgets/announcement.dart';
import 'package:osmmas/widgets/page_title.dart';

class AnnouncementScreen extends StatelessWidget {
  static const String routeName = 'announcement';
  @override
  Widget build(BuildContext context) {
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
                PageTitle("ANNOUNCEMENTS", false),
              ],
            ),
          ),
          Announcement(),
          Announcement(),
          Announcement(),
          // Announcement(),
          // Announcement(),
          // Announcement(),
          // Announcement(),
        ],
      ),
    );
  }
}
