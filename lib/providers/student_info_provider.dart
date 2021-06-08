import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:osmmas/models/student.dart';
import 'package:osmmas/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StudentInfoProvider with ChangeNotifier {
  Student _student;

  Student get student {
    return _student;
  }

  Future<void> getStudentInfo() async {
    var url =
        Uri.parse("https://osmmasapi.herokuapp.com/api/parent/studentinfo");
    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            "Bearer TJAeNS6B5UJrgjf5wTBvVUXlienGZ6FM5n8bTXC3"
      });
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }

      Student student = Student(
        name: extractedData[0]["Fname"] +
            " " +
            extractedData[0]["Mname"] +
            " " +
            extractedData[0]["Lname"],
        parentName:
            extractedData[0]["Fathername"] + " " + extractedData[0]["Lname"],
        phone: extractedData[0]["fNumber"],
        email: extractedData[0]["email"],
        username: extractedData[0]["username"],
        idNo: extractedData[0]["rollid"],
      );

      _student = student;

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
