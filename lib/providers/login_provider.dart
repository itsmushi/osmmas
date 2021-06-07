import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:osmmas/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  User _user;

  User get user {
    return _user;
  }

  void addUser(User user) {
    final newUser = User();
    _user = newUser;
    notifyListeners();
  }

  Future<void> verifyUser(String username, String password) async {
    var url = Uri.parse("https://osmmasapi.herokuapp.com/api/auth/login");
    try {
      final response = await http
          .post(url, body: {"username": username, "password": password});

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      // extractedData
      User loggedInUser = User(
          message: extractedData["message"],
          status: extractedData["status"],
          token: extractedData["data"]["token"]);
      _user = loggedInUser;

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', loggedInUser.token);

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
