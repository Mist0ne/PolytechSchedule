import 'package:sqflite/sqflite.dart';
import 'package:polytechschedule/work_with_data/LectureClass.dart';

class WorkWithSQL{
  static initDB() async {
    try{
      var database = await openDatabase('schedule.db');
      await database.execute("CREATE TABLE groups(groupNumber TEXT);");
      await database.execute("CREATE TABLE lectures(groupNumber TEXT, day TEXT, time TEXT, auditories TEXT, subject TEXT, type TEXT, teacher TEXT, dates TEXT);");
    }
    catch (Exception) {
      print(Exception);
    }
  }

  static AddNewGroup(group) async{
    try{
      var database = await openDatabase('schedule.db');
      database.insert("groups", {"groupNumber": group});
      database.close();
    }
    catch(Exception){
      print(Exception);
      await initDB();
      await AddNewGroup(group);
    }
  }

  static DeleteAllGroups() async{
    try{
      var database = await openDatabase('schedule.db');
      database.execute("DELETE FROM groups");
      database.close();
    }
    catch(Exception){
      await initDB();
      print(Exception);
    }
  }

  static GetAllGroups() async{
    try{
      var database = await openDatabase('schedule.db');
      List<Map> dataList = await database.rawQuery('SELECT rowid, groupNumber FROM groups');
      database.close();
      return dataList;
    }
    catch(Exception){
      print(Exception);
      initDB();
      return null;
    }
  }

  static GetFirstGroup() async{
    var dataList = await GetAllGroups();
    if(dataList == null){
      await initDB();
      return null;
    }
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
      await initDB();
      print(Exception);
    }
  }

  static DeleteAllSchedule() async{
    try{
      var database = await openDatabase('schedule.db');
      database.execute("DELETE FROM lectures");
      database.close();
    }
    catch(Exception){
      await initDB();
      print(Exception);
    }
  }

  static GetAllSchedule() async{
    var database = await openDatabase('schedule.db');

    try {
      List<Map> dataList = await database.rawQuery('SELECT * FROM lectures');
      database.close();
      return dataList;
    }
    catch (Exception){
      await initDB();
      print(Exception);
    }
  }

  static GetGroupSchedule(group) async{
    var database = await openDatabase('schedule.db');

    try{
      List<Map> dataList = await database.rawQuery('SELECT * FROM lectures where groupNumber = ?', [group]);
      database.close();
      return dataList;
    }
    catch (Exception){
      await initDB();
      print(Exception);
    }
  }

  static DropAllTables() async{
    try{
      var database = await openDatabase('schedule.db');
      await database.execute("DROP TABLE groups");
      await database.execute("DROP TABLE lectures");
      database.close();
    }
    catch(Exception){
      await initDB();
      print(Exception);
    }
  }
}