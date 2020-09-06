import 'package:flutter/material.dart';

class MainWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //ToDo убрать лишнее
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polytech schedule'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300.0,
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {Navigator.pushNamed(context, '/semesterSchedule');},
                child: Text('Расписание семестровое', style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),

            SizedBox(
              width: 300.0,
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {},
                child: Text('Расписание преподавателя', style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),

            SizedBox(
              width: 300.0,
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {},
                child: Text('Расписание сессии', style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
