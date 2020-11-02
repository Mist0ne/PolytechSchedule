import 'package:flutter/material.dart';
import 'package:polytechschedule/MainWindow.dart';
import 'package:polytechschedule/semester_schedule/SemesterSchedule.dart';
import 'session_schedule/SessionSchedule.dart';
import 'lecturer_schedule/LecturerSchedule.dart';


class CustomDrawer extends StatelessWidget{
  var _title;
  Map<String, dynamic> _buttons = {
    'Главный экран': MainWindow(),
    'Семестровое расписание': SemesterScheduleView(),
    'Сессионное расписание': SessionSchedule(),
    'Расписание преподавателя': LecturerSchedule()
  };

  CustomDrawer(String title){
    _buttons.remove(title);
    _title = title;
  }

  Widget _buildButtonsList(context) {
    return Column(
      children: _buttons.entries.map((entry) {
        return ListTile(
          title: Text(entry.key, style: TextStyle(fontSize: 20.0)),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => entry.value));
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Text(_title, style: TextStyle(fontSize: 24.0)),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),

          _buildButtonsList(context)
        ],
      ),
    );
  }

}