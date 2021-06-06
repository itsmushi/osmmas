import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:osmmas/models/announcement.dart';

import '../models/event.dart';

class AnnouncementProvider with ChangeNotifier {
  List<AnnouncementModel> _announcement = [];

  List<AnnouncementModel> get announcement {
    return [..._announcement];
  }

  Future<void> fetchAnnouncement() async {
    var url = Uri.parse("https://osmmasapi.herokuapp.com/api/parent/announcement");
    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            "Bearer TJAeNS6B5UJrgjf5wTBvVUXlienGZ6FM5n8bTXC3"
      });
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }

      final List<AnnouncementModel> loadedAnnouncements = [];

      extractedData.forEach((eventData) {
        loadedAnnouncements.add(
          AnnouncementModel(
              createdOn: eventData["createdOn"],
              announceDesc: eventData["announceDesc"],
              title: eventData["title"]),
        );
      });

      _announcement = loadedAnnouncements;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
