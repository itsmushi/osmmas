import 'package:flutter/material.dart';

class SuggestionScreen extends StatelessWidget {
   static const String routeName="suggestion";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
      ),
      body: Center(
        child: Text("Suggestion Screen"),
      ),
    );
  }
}
