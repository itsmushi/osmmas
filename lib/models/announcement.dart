import 'package:flutter/material.dart';

class AnnouncementModel with ChangeNotifier {
  final String createdOn;
  final String announceDesc;
  final String title;

  AnnouncementModel({
    @required this.createdOn,
    @required this.announceDesc,
    @required this.title,
  });
}
