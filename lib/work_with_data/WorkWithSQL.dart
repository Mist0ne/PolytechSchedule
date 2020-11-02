import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:polytechschedule/work_with_data/LectureClass.dart';

class WorkWithSQL{
  static AddNewGroup(group) async{
    try{
      final Database database = await openDatabase(
        join(await getDatabasesPath(), 'schedule.db'),
        onCreate: (db, version) {
          db.execute(
            "CREATE TABLE groups(groupNumber TEXT);"
                "CREATE TABLE lectures(groupNumber TEXT, day TEXT, time TEXT, auditories TEXT, "
                "subject TEXT, type TEXT, teacher TEXT, dates TEXT);",
          );
        },
        version: 1,
      );
      database.insert("groups", {"groupNumber": group});

      database.close();
    }
    catch(Exception){
      print(Exception);
    }
  }

  static DeleteAllGroups() async{
    var database = await openDatabase('schedule.db');

    database.execute("DELETE FROM groups");
    database.close();
  }

  static GetAllGroups() async{
    var database = await openDatabase('schedule.db');

    List<Map> dataList = await database.rawQuery('SELECT rowid, groupNumber FROM groups');
    database.close();
    return dataList;
  }

  static GetFirstGroup() async{
    var database = await openDatabase('schedule.db');

    List<Map> dataList = await database.rawQuery('SELECT rowid, groupNumber FROM groups');
    database.close();
    return dataList[0]['groupNumber'];
  }


  static AddNewSchedule(var database, String group, String day, LectureClass lecture) async{
    try{
       Map<String, String> lectureTemp = lecture.ToMap();
       lectureTemp['day'] = day;
       lectureTemp['groupNumber'] = group;
       await database.insert("lectures",
         lectureTemp
       );
    }
    catch(Exception){
      print(Exception);
    }
  }

  static DeleteAllSchedule() async{
    var database = await openDatabase('schedule.db');

    database.execute("DELETE FROM lectures");
    database.close();
  }

  static GetAllSchedule() async{
    var database = await openDatabase('schedule.db');

    List<Map> dataList = await database.rawQuery('SELECT * FROM lectures');
    database.close();
    return dataList;
  }

  static DropAllTables() async{
    var database = await openDatabase('schedule.db');
    //await database.execute("DROP TABLE groups");
    //await database.execute("DROP TABLE lectures");
    await database.execute(
      "CREATE TABLE groups(groupNumber TEXT);"
    );

    await database.execute("CREATE TABLE lectures(groupNumber TEXT, day TEXT, time TEXT, auditories TEXT, subject TEXT, type TEXT, teacher TEXT, dates TEXT);"
    );
    database.close();
  }
}