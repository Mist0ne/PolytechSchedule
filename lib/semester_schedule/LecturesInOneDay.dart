import 'package:flutter/material.dart';
import 'package:polytechschedule/work_with_data/LectureClass.dart';

class LecturesInOneDay extends StatelessWidget{
  List<Map<String, String>> _data = new List();

  LecturesInOneDay(List<LectureClass> data){
    for(var item in data){
      var leading = '';
      var title = '';
      var subtitle = '';

      var time = item.time.split('-');
      if(time.length == 2){
        leading += time[0] + '\n     -\n' + time[1];
      }
      else
        leading += ' ';

      if(item.auditories.contains('Обучение в LMS'))
        title += 'Обучение в LMS' + '\n';
      else
        title += item.auditories + '\n';
      title += item.subject + '\n';
      title += item.type;

      subtitle += item.teacher + '\n';
      subtitle += item.dates + '\n';


      _data.add({
        'subtitle': subtitle,
        'leading': leading,
        'title': title
      });
    }
  }

  List<Widget> _buildLecturesList(){
    return _data.map((Map<String, String> lecture) => InkWell(
      splashColor: Colors.black54.withAlpha(30),
      onTap: () {

      },
      child: ListTile(
        leading: Text(lecture['leading']),
        title: Text(lecture['title']),
        subtitle: Text(lecture['subtitle']),
      )
    )).toList();

//    return _data.asMap().entries.map((entry) => InkWell(
//        splashColor: Colors.black54.withAlpha(30),
//        onTap: () {
//          print(entry.key);
//        },
//        child: ListTile(
//          leading: Text(entry.value['time']),
//          title: Text(entry.value['subject']),
//          subtitle: Text(entry.value['teacher']),
//        )
//    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _buildLecturesList(),
      ),
    );
  }
}