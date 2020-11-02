import 'package:flutter/material.dart';
import 'package:polytechschedule/MainWindow.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.grey,
      //floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.grey),
    ),
    debugShowCheckedModeBanner: false,
    home: MainWindow(),
  ));
}
