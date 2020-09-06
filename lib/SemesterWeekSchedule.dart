import 'package:flutter/material.dart';
import 'package:polytechschedule/DayCard.dart';

class SemesterWeekSchedule extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        children: <Widget>[
          DayCard('Понедельник'),
          DayCard('Вторник'),
          DayCard('Среда'),
          DayCard('Четверг'),
          DayCard('Пятница'),
          DayCard('Суббота'),
          SizedBox(
            height: 80.0,
          ),
        ],
      ),
    );
  }
}