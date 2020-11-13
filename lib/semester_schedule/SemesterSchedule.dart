import 'package:flutter/material.dart';
import 'package:polytechschedule/work_with_data/LectureClass.dart';
import 'package:polytechschedule/work_with_data/ScheduleSQL.dart';
import 'DayCard.dart';
import '../CustomDrawer.dart';


class SemesterScheduleView extends StatefulWidget{
  @override
  _SemesterScheduleViewState createState() => _SemesterScheduleViewState();
}


class _SemesterScheduleViewState extends State<SemesterScheduleView>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Map<String, List<LectureClass>> _data = {
    'Понедельник': [new LectureClass.empty()],
    'Вторник': [new LectureClass.empty()],
    'Среда': [new LectureClass.empty()],
    'Четверг': [new LectureClass.empty()],
    'Пятница': [new LectureClass.empty()],
    'Суббота': [new LectureClass.empty()]
  };

  _loadData() async{
    var textForSnackBar = 'Актуальные данные успешно загружены с сервера';

    var data = await ScheduleSQL.loadDataFromServerToDB(null);

    if (data == null) {
      data = await ScheduleSQL.parseScheduleFromDB(null);
      textForSnackBar = 'Данные загружены из базы данных из-за проблем с сетью';
    }

    if (data != null){
      setState(() {
        _data = data;
      });
    }

    if (data == null) {
      textForSnackBar = 'Не удалось загрузить данные';
    }

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(textForSnackBar, style: TextStyle(fontSize: 20, color: Colors.white)),
      backgroundColor: Colors.grey,
    ));
  }

  @override
  void initState(){
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
