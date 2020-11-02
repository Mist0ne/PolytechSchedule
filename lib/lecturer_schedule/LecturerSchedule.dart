import 'package:flutter/material.dart';
import 'package:polytechschedule/CustomDrawer.dart';

class LecturerSchedule extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          title: Text('Расписание преподавателя'),
        ),

        body: Center(
          child: Text('В разработке..'),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => print('Test update data'),
        ),

        drawer: CustomDrawer('Расписание преподавателя')
    );
  }
}