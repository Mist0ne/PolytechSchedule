import 'package:flutter/material.dart';
import 'package:polytechschedule/MainWindow.dart';
import 'package:polytechschedule/SemesterSchedule.dart';


void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.grey,
      //floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.grey),
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(BuildContext context) => MainWindow(),
      '/semesterSchedule':(BuildContext context) => SemesterSchedule(),
    },
  ));
}
