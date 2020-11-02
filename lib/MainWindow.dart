import 'package:flutter/material.dart';
import 'package:polytechschedule/semester_schedule/SemesterSchedule.dart';
import 'session_schedule/SessionSchedule.dart';
import 'lecturer_schedule/LecturerSchedule.dart';
import 'CustomDrawer.dart';
import 'work_with_data/WorkWithSQL.dart';

class MainWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

//ToDo добавить проверку поля группы
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Расписание МосПолитеха'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 220,
                    padding: EdgeInsetsDirectional.only(bottom: 30.0),
                    child: TextField(
                      controller: GroupController,
                      onSubmitted: (String value) async {
                        await WorkWithSQL.DropAllTables();
                        await WorkWithSQL.AddNewGroup(GroupController.text);
                        // await WorkWithSQL.GetAllGroups();
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                      decoration: InputDecoration(
                        labelText: 'Номер группы'
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 30.0,
                  ),

                  RaisedButton(
                    color: Colors.white,
                    child: Text('Найти', style: TextStyle(fontSize: 20.0, color: Colors.black)),
                    onPressed: () async{
                      Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Уже ищу твое расписание..', style: TextStyle(fontSize: 20, color: Colors.white)),
                      backgroundColor: Colors.grey,
                    ));
                      await WorkWithSQL.DeleteAllGroups();
                      await WorkWithSQL.AddNewGroup(GroupController.text);
                      // await WorkWithSQL.GetAllGroups();
                    }
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 300.0,
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SemesterScheduleView()));},
                child: Text('Расписание семестровое', style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),

            SizedBox(
              width: 300.0,
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LecturerSchedule()));},
                child: Text('Расписание преподавателя', style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),

            SizedBox(
              width: 300.0,
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SessionSchedule()));},
                child: Text('Расписание сессии', style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer('Главный экран')
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    GroupController.dispose();
    super.dispose();
  }
}
