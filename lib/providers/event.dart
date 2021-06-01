import 'package:flutter/material.dart';

class Event with ChangeNotifier{
  final String date;
  final String event;
  final String validTo="";

  Event({
    @required this.date,
    @required this.event,
    
  });

}