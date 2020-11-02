import 'package:flutter/material.dart';
import 'package:polytechschedule/work_with_data/LectureClass.dart';
import 'package:polytechschedule/work_with_data/WorkWithSQL.dart';
import 'package:sqflite/sqflite.dart';
import 'DayCard.dart';
import '../CustomDrawer.dart';
import 'package:polytechschedule/work_with_data/SemesterData.dart';


class SemesterScheduleView extends StatefulWidget{
  @override
  _SemesterScheduleViewState createState() => _SemesterScheduleViewState();
}


class _SemesterScheduleViewState extends State<SemesterScheduleView>{
  Map<String, List<LectureClass>> _data = {
    'Понедельник': [new LectureClass.empty()],
    'Вторник': [new LectureClass.empty()],
    'Среда': [new LectureClass.empty()],
    'Четверг': [new LectureClass.empty()],
    'Пятница': [new LectureClass.empty()],
    'Суббота': [new LectureClass.empty()]
  };

  _loadData() async{
    final group = await WorkWithSQL.GetFirstGroup();
    var data = await SemesterData.getDataFromServer(group);

    await WorkWithSQL.DeleteAllSchedule();
    final database = await openDatabase('schedule.db');
    await database.transaction((txn) async{
      data.forEach((k, v) async{
        for (var i = 0; i < v.length; i++){
          LectureClass lec = new LectureClass(v[i].subject, v[i].teacher, v[i].dates, v[i].auditories, v[i].type, v[i].time);
          await WorkWithSQL.AddNewSchedule(txn, group, k, lec);
        }
      });
    });

    setState(() {
      _data = data;
    });
  }

  @override
  void initState(){
    super.initState();
    WorkWithSQL.GetAllGroups();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          title: Text('Семестровое расписание'),
        ),

        body: ListView(
          children: <Widget>[
            DayCard('Понедельник', _data['Понедельник']),
            DayCard('Вторник', _data['Вторник']),
            DayCard('Среда', _data['Среда']),
            DayCard('Четверг', _data['Четверг']),
            DayCard('Пятница', _data['Пятница']),
            DayCard('Суббота', _data['Суббота']),
            SizedBox(
              height: 80.0,
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            _loadData();
          },
        ),

        drawer: CustomDrawer('Семестровое расписание')
    );
  }
}
