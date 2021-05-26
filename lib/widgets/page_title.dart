import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  PageTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: Row(
          
          children: [
            Icon(
              Icons.desktop_mac,
              color: Color.fromRGBO(96, 100, 102, 1.0),
              size: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                this.title,
                
                style: TextStyle(
                  color: Color.fromRGBO(96, 100, 102, 1.0),
                  fontSize: 20
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
