import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/event.dart';

class Dashboard with ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events {
    return [..._events];
  }

  Future<void> fetchEvents() async {
    var url = Uri.parse("https://osmmasapi.herokuapp.com/api/parent/dashboard");
    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            "Bearer TJAeNS6B5UJrgjf5wTBvVUXlienGZ6FM5n8bTXC3"
      });
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }
     
      final List<Event> loadedEvents = [];
      extractedData.forEach((eventData) {
        loadedEvents.add(
          Event(
            date: eventData["date"],
            event: eventData["event"],
          ),
        );
      });

      _events = loadedEvents;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
