import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String status;
  final String message;
  final String token;

  User({
    @required this.status,
    @required this.message,
    @required this.token,
  });
}



