import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "2021-04-31",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              "Announcement Title",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Text(
            "Text annnouncemtn  body goes right hereeee and its veryv very loooong",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              "Admin",
              style: TextStyle(color: Colors.cyan, fontSize: 14),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
