import 'package:flutter/material.dart';
import 'package:osmmas/screens/dashboard_screen.dart';
import 'package:osmmas/screens/reports_screen.dart';
import 'package:osmmas/screens/subject_list_screen.dart';
import 'package:osmmas/widgets/app_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//   Map<int, Color> colorb =
// {
// 50:Color.fromRGBO(136,14,79, .1),
// 100:Color.fromRGBO(136,14,79, .2),
// 200:Color.fromRGBO(136,14,79, .3),
// 300:Color.fromRGBO(136,14,79, .4),
// 400:Color.fromRGBO(136,14,79, .5),
// 500:Color.fromRGBO(136,14,79, .6),
// 600:Color.fromRGBO(136,14,79, .7),
// 700:Color.fromRGBO(136,14,79, .8),
// 800:Color.fromRGBO(136,14,79, .9),
// 900:Color.fromRGBO(136,14,79, 1),
// };

// MaterialColor colorCustom = MaterialColor(0xFF880E4F, colorb);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'osmmas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        // fontFamily: 'Lato',
      ),
      home: MyHomePage(),
      routes: {
        ReportScreen.routeName:(_)=>ReportScreen(),
        SubjectListScreen.routeName:(_)=>SubjectListScreen(),
       
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
      ),
      body: DashboardScreen(),
      
      drawer: AppDrawer(),
      
      
    );
    
  }
}
