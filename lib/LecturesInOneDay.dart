import 'package:flutter/material.dart';

class LecturesInOneDay extends StatelessWidget{
  List<Map<String,dynamic>> _data;
  LecturesInOneDay(List<Map<String,dynamic>> data){
    _data = data;
  }

  List<Widget> _buildLecturesList(){
    return _data.map((Map<String,dynamic> lecture) => InkWell(
      splashColor: Colors.black54.withAlpha(30),
      onTap: () {
        print(lecture['teacher']);
      },
      child: ListTile(
        leading: Text(lecture['time']),
        title: Text(lecture['subject']),
        subtitle: Text(lecture['teacher']),
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