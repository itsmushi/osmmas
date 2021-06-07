import 'package:flutter/material.dart';
import 'package:osmmas/main.dart';
import 'package:osmmas/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _url = "https://osmmas.herokuapp.com/getstarted/forgot-password.php";

  final _form = GlobalKey<FormState>();

  var username = "";

  var password = "";



  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
   

    if (token != null) {
      setState(() {
       
        Navigator.of(context).pushReplacementNamed(MyHomePage.routeName);
      });
      return;
    }
  }

  void didChangeDependency() {
    print("herere");
    super.initState();
    autoLogIn();
  }

  void _saveForm(BuildContext context) {
    // final isValid = _form.currentState.validate();
    // if (!isValid) {
    //   return;
    // }
    _form.currentState.save();
    print(this.username);
    print(this.password);
    Provider.of<LoginProvider>(context, listen: false)
        .verifyUser("S0485/2019/P/112", "password")
        .then(
           
      
          (value) => Navigator.of(context).pushReplacementNamed(MyHomePage.routeName),
        ).catchError((Error error){
          print(error);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
                                  decoration: InputDecoration(
                                      hintText: "Email/Username"),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please username';
                                    }
                                  },
                                  onSaved: (value) => this.username = value,
                                ),
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration:
                                    InputDecoration(hintText: "Password"),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                },
                                onSaved: (value) => this.password = value,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: RaisedButton(
                                  onPressed: () {
                                    _saveForm(context);
                                  },
                                  child: Text("Login"),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                      // onPressed: _launchURL,
                                      onPressed: () {
                                        Provider.of<LoginProvider>(context,
                                                listen: false)
                                            .verifyUser(
                                                "S0485/2019/P/112", "password")
                                            .then(
                                              (value) =>
                                                  print("show logged  in"),
                                            );
                                      },
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
          ),
        ],
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url, forceWebView: true, enableJavaScript: true)
      : throw 'Could not launch $_url';
}
