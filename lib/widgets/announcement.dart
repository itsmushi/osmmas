import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
 final String createdOn;
  final String announceDesc;
  final String title;

  Announcement({
    @required this.createdOn,
    @required this.announceDesc,
    @required this.title,
  });


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
                this.createdOn,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              this.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Text(
            this.announceDesc,
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
