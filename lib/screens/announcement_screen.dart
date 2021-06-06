import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:osmmas/models/announcement.dart';
import 'package:osmmas/providers/announcement_provider.dart';
import 'package:osmmas/widgets/announcement.dart';
import 'package:osmmas/widgets/page_title.dart';

class AnnouncementScreen extends StatelessWidget {
  static const String routeName = 'announcement';

  Future<void> _refreshAnnouncement(
    BuildContext context,
  ) async {
    await Provider.of<AnnouncementProvider>(context).fetchAnnouncement();
  }

  bool firstTime = true;
  int count = 1;
  bool showLoading = true;

  List<AnnouncementModel> announcementsData;

  List<Widget> announcementWidgets=[];

  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      _refreshAnnouncement((context)).then((value) => {
            announcementsData =
                Provider.of<AnnouncementProvider>(context, listen: false)
                    .announcement,
            showLoading = false,
            firstTime = false,
            print(announcementsData[0].title),
            announcementsData.forEach((element) {
              announcementWidgets.add(
                Announcement(
                  announceDesc: element.announceDesc,
                  createdOn: element.createdOn,
                  title: element.title,
                ),
              );
            })
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitle("ANNOUNCEMENTS", false),
                ],
              ),
            ),
            // Announcement(
            //   announceDesc: "sdf",
            //   createdOn: "fds",
            //   title: "sdf",
            // ),
            showLoading
                ? Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  )
                : Column(
                    children: [...announcementWidgets],
                  )
          ],
        ),
      ),
    );
  }
}
