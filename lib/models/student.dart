import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Student with ChangeNotifier {
  String name;
  String parentName;
  String phone;
  String email;
  String username;
  String idNo;

  Student({
    @required this.name,
    @required this.parentName,
    @required this.phone,
    @required this.email,
    @required this.username,
    @required this.idNo,

  });

 
}
