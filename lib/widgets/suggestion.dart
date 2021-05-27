import 'package:flutter/material.dart';

class Suggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: [Text("Title"), Text("Suggestion body"), Text("actions")],
      ),
    );
  }
}
