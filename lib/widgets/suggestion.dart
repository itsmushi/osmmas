import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class Suggestion extends StatelessWidget {
  String title;
  String content;
  int upvote;
  int downvote;

  Suggestion({
    @required this.title,
    @required this.content,
    @required this.upvote,
    @required this.downvote,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Card(
        elevation: 6,
        color: Color.fromRGBO(206, 93, 92, 1.0),
        margin: EdgeInsets.symmetric(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Divider(),
                  Text(
                    content,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  ListTile(
                    trailing: SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          Text(upvote.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          IconButton(
                              icon: Icon(
                                Icons.thumb_up,
                                size: 20,
                              ),
                              color: Colors.white,
                              onPressed: () {}),
                          SizedBox(
                            width: 12,
                          ),
                          Text(downvote.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                                size: 20,
                              ),
                              color: Colors.white,
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                            onPressed: () => addSuggestion(context),
                            child: Icon(Icons.add)),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future addSuggestion(BuildContext context) {
    return Alert(
        context: context,
        title: "Add Suggestion",
        content: Container(
          width: 400,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "(Suggestion is anonymously!)",
                  labelText: 'Title',
                ),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                decoration: InputDecoration(
                  labelText: 'Suggestion',
                ),
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ]).show();
  }
}
