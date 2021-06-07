import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:osmmas/models/user.dart';

import '../models/event.dart';

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
        print("request sent0");
      final response = await http
          .post(url, body: {"username": username, "password": password});
          print("request sent");
      final extractedData = json.decode(response.body) as Map<String,dynamic>;
      if (extractedData == null) {
        return;
      }
      
    
      print(extractedData);



      // extractedData
      User loggedInUser = User(
          message: extractedData["message"],
          status: extractedData["status"],
          token: extractedData["data"]["token"]);
      _user = loggedInUser;
      
      notifyListeners();
      print("_user");
      print(_user.token);
    } catch (error) {
      throw error;
    }
  }
}
