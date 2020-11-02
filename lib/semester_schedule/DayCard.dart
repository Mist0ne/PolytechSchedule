import 'package:flutter/material.dart';
import 'package:polytechschedule/semester_schedule/LecturesInOneDay.dart';
import 'package:polytechschedule/work_with_data/LectureClass.dart';

class DayCard extends StatelessWidget{
  var _day;
  List<LectureClass> _data = new List<LectureClass>();

  DayCard(day, data){
    _day = day;
    _data = data;
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(_day, style: TextStyle(
                    fontSize: 20
                )),
              ),
            ),

            Divider(
              color: Colors.grey,
              height: 20,
              thickness: 5,
            ),

            LecturesInOneDay(_data)
          ],
        ),
      ),
    );
  }
}
