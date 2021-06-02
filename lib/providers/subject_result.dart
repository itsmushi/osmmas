import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:osmmas/models/month_result.dart';

class SubjectResult with ChangeNotifier {
  List<MonthResult> _results = [];
  List<MonthResult> get results {
    return [..._results];
  }

  Future<void> fetchResults(String year, String code) async {
    final url = Uri.parse("https://osmmasapi.herokuapp.com/api/parent/report/" +
        year +
        '/' +
        code);
    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            "Bearer TJAeNS6B5UJrgjf5wTBvVUXlienGZ6FM5n8bTXC3"
      });

      var extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }

    

      List<MonthResult> loadedResults = [];
       int counter=0;
       extractedData=extractedData[0];
      extractedData.forEach((element) {
        loadedResults.add(
          MonthResult(
              mark: element["marks"],
              monthOf: element["monthOf"],
              grade: element["grade"]),
        );
      });
      print(loadedResults);
      _results = loadedResults;

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
