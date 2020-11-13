import 'package:sqflite/sqflite.dart';

import 'LectureClass.dart';
import 'SemesterData.dart';
import 'WorkWithSQL.dart';

class ScheduleSQL{
  static loadDataFromServerToDB(String group_) async{
    String group;
    group_ == null
        ? group = await WorkWithSQL.GetFirstGroup()
        : group = group_;

    if(group == null)
      return null;

    var data = await SemesterData.getDataFromServer(group);

    if (data != null){
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
      return data;
    }

    return null;
  }

  static parseScheduleFromDB(String group_) async {
    String group;
    group_ == null
        ? group = await WorkWithSQL.GetFirstGroup()
        : group = group_;

    if(group == null)
      return null;

    var dataFromSql = await WorkWithSQL.GetGroupSchedule(group);
    var returnData = {
      'Понедельник': List<LectureClass>(),
      'Вторник': List<LectureClass>(),
      'Среда': List<LectureClass>(),
      'Четверг': List<LectureClass>(),
      'Пятница': List<LectureClass>(),
      'Суббота': List<LectureClass>(),
    };

    if (dataFromSql != null){
      for (var i in dataFromSql){
        returnData[i['day']].add(LectureClass(i['subject'], i['teacher'], i['dates'], i['auditories'], i['type'], i['time']));
      }
    }

    return returnData;
  }
}