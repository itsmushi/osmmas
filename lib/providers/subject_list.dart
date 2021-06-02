import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/subject.dart';

class SubjectList with ChangeNotifier {
  List<Subject> _subjects = [];
  List<Subject> get subjects {
    return [..._subjects];
  }

  Future<void> fetchSubjects(String year) async {
    final url =
        Uri.parse("https://osmmasapi.herokuapp.com/api/parent/report/" + year);
    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            "Bearer TJAeNS6B5UJrgjf5wTBvVUXlienGZ6FM5n8bTXC3"
      });

      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }
  

      final List<Subject> loadedSubjects = [];

      extractedData.forEach((element) {
        loadedSubjects.add(Subject(
            subjectOf: element["subjectOf"],
            subjectName: element["subjectName"]));
      });

      _subjects = loadedSubjects;

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
