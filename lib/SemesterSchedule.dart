import 'package:flutter/material.dart';
import 'package:polytechschedule/SemesterWeekSchedule.dart';

class SemesterSchedule extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(
            title: Text('Semester schedule'),
          ),
      body: SemesterScheduleView()
    );
  }
}


class SemesterScheduleView extends StatefulWidget{
  @override
  _SemesterScheduleViewState createState() => _SemesterScheduleViewState();
}


class _SemesterScheduleViewState extends State<SemesterScheduleView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SemesterWeekSchedule(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => print('Test update data'),
      ),
    );
  }
}
