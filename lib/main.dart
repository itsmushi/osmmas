import 'package:flutter/material.dart';
import 'package:osmmas/providers/announcement_provider.dart';
import 'package:osmmas/providers/login_provider.dart';
import 'package:osmmas/providers/student_info_provider.dart';
import 'package:osmmas/providers/subject_list.dart';
import 'package:osmmas/providers/subject_result.dart';
import 'package:osmmas/providers/suggestion_provider.dart';
import 'package:osmmas/screens/announcement_screen.dart';
import 'package:osmmas/screens/average_result_screen.dart';
import 'package:osmmas/screens/dashboard_screen.dart';
import 'package:osmmas/screens/login.dart';
import 'package:osmmas/screens/reports_screen.dart';
import 'package:osmmas/screens/student_info_sreen.dart';
import 'package:osmmas/screens/subject_list_screen.dart';
import 'package:osmmas/screens/subject_result_screen.dart';
import 'package:osmmas/screens/suggestion_screen.dart';
import 'package:osmmas/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'providers/dashboard.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Dashboard(),
        ),
        ChangeNotifierProvider.value(
          value: SubjectList(),
        ),
        ChangeNotifierProvider.value(
          value: SubjectResult(),
        ),
        ChangeNotifierProvider.value(
          value: AnnouncementProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LoginProvider(),
        ),
        ChangeNotifierProvider.value(
          value: StudentInfoProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SuggestionProvider(),
        )
      ],
      child: MaterialApp(
        title: 'osmmas',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          // fontFamily: 'Lato',
        ),
        home: LoginScreen(),
        routes: {
          ReportScreen.routeName: (_) => ReportScreen(),
          SubjectListScreen.routeName: (_) => SubjectListScreen(),
          SubjectResultsScreen.routeName: (_) => SubjectResultsScreen(),
          AverageResultsScreen.routeName: (_) => AverageResultsScreen(),
          SuggestionScreen.routeName: (_) => SuggestionScreen(),
          StudentInfoScreen.routeName: (_) => StudentInfoScreen(),
          AnnouncementScreen.routeName: (_) => AnnouncementScreen(),
          MyHomePage.routeName: (_) => MyHomePage(),
          LoginScreen.routeName: (_) => LoginScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = "home";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Null> _logoutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    prefs.setString('token', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: _logoutUser)],
      ),
      body: DashboardScreen(),
      drawer: AppDrawer(),
    );
  }
}
