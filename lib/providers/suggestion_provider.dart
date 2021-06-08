import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:osmmas/models/suggestion_model.dart';

class SuggestionProvider with ChangeNotifier {
  List<SuggestionModel> _suggestion = [];

  List<SuggestionModel> get suggestion {
    return [..._suggestion];
  }

  Future<void> fetchSuggestion() async {
    var url =
        Uri.parse("https://osmmasapi.herokuapp.com/api/parent/suggestion");
    try {
      final response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            "Bearer TJAeNS6B5UJrgjf5wTBvVUXlienGZ6FM5n8bTXC3"
      });
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }

      final List<SuggestionModel> loadedSuggestion = [];

      extractedData.forEach((element) {
        loadedSuggestion.add(SuggestionModel(
          userId: extractedData[element]["userId"],
          title: extractedData[element]["title"],
          content: extractedData[element]["content"],
          upvote: extractedData[element]["upvote"],
          downvote: extractedData[element]["downvote"],
          regNum: extractedData[element]["regNum"],
        ));
      });

      _suggestion = loadedSuggestion;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
