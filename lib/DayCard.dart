import 'package:flutter/material.dart';
import 'package:polytechschedule/LecturesInOneDay.dart';

class DayCard extends StatelessWidget{
  var _day;
  List<Map<String,dynamic>> _test = new List<Map<String,dynamic>>();
  DayCard(String day){
    _day = day;
    for (int i = 0; i < 5; i++)
      {
        _test.add(
            {
              "time": "10:40\n     -\n12:10",
              "subject": "Мобильная разработка приложений на C#.  Аудитория Н-505",
              "teacher": "Исаев Александр Сергеевич",
            }
        );
      }
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

            LecturesInOneDay(_test)
          ],
        ),
      ),
    );
  }
}
