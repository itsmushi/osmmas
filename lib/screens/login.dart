import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  final _url = "https://osmmas.herokuapp.com/getstarted/forgot-password.php";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
      ),
      body: Card(
        elevation: 8,
        child: Column(
          children: [
            Text("Login"),
            Divider(),
           
            FlatButton(onPressed: _launchURL, child: Text("I forgot my password"))
          ],
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url, forceWebView: true, enableJavaScript: true)
      : throw 'Could not launch $_url';
}
