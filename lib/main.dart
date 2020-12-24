import 'package:flutter/material.dart';
import './screens/homepage.dart';
import './screens/mainpage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "zomato",
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xFF143D59),
          accentColor: Colors.amber,
          textTheme: TextTheme(
                  headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                  headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                  bodyText2: TextStyle(fontSize: 14.0),
          )
        ),
        initialRoute: '/',
        routes: {
          '/' : (context)=> HomePage(),
          '/mainpage' : (context) => MainPage()
        },
    );

  }
}

