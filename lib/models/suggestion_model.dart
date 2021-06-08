import 'package:flutter/material.dart';

class SuggestionModel with ChangeNotifier {
  String userId;
  String title;
  String content;
  int upvote;
  int downvote;
  String regNum;

  SuggestionModel({
    @required this.userId,
    @required this.title,
    @required this.content,
    @required this.upvote,
    @required this.downvote,
    @required this.regNum,
  });
}
