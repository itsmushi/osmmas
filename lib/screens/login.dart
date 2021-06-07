import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _url = "https://osmmas.herokuapp.com/getstarted/forgot-password.php";

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            elevation: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Text("Login",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Divider(),
                    Form(
                      key: _form,
                      child: Container(
                        height: 500,
                        width: 400,
                        child: ListView(
                          children: [
                            Container(
                              width: 200,
                              child: TextFormField(
                                decoration:
                                    InputDecoration(hintText: "Email/Username"),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            
                             
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(hintText: "Password"),
                                textInputAction: TextInputAction.next,
                              ),
                           
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: RaisedButton(
                                onPressed: () {},
                                child: Text("Login"),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                    onPressed: _launchURL,
                                    child: Text("I forgot my password")),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url, forceWebView: true, enableJavaScript: true)
      : throw 'Could not launch $_url';
}
