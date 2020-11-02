import 'package:flutter/material.dart';
import 'package:polytechschedule/CustomDrawer.dart';

class SessionSchedule extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          title: Text('Сессионное расписание'),
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