import 'package:http/http.dart' as http;
import 'dart:convert';
import 'LectureClass.dart';


class SemesterData{
  static getDataFromServer(group) async{
    Map<String, String> header = {
      "Connection": "keep-alive",
      "Accept": "*/*",
      "X-Requested-With": "XMLHttpRequest",
      "Sec-Fetch-Site": "same-origin",
      "Sec-Fetch-Mode": "cors",
      "Sec-Fetch-Dest": "empty",
      "Referer": "https://rasp.dmami.ru/session",
      "Accept-Language": "ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7",
    };
    var rasp = ['', '9:00-10:30', '10:40-12:10', '12:20-13:50', '14:30-16:00', '16:10-17:40', '17:50-19:20', '19:30-21:00'];
    var daysInWeek = ['', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота'];

    Map<String, List<LectureClass>> returnData = new Map<String, List<LectureClass>>();

    try {
      var response = await http.post(
          "https://rasp.dmami.ru/site/group?group=$group&session=0",
          headers: header
      );

      if(response.statusCode == 200) {
        if(json.decode(response.body)['status'] == 'ok') {
          var data = json.decode(response.body)['grid'];
          for (var dayNumberEntry in data.entries) {
            List<LectureClass> dayLectures = new List<LectureClass>();
            var dayRasp = Map.from(dayNumberEntry.value);
            for(var lessonEntry in dayRasp.entries){
              if(lessonEntry.value.length != 0){
                dayLectures.add(new LectureClass(
                    lessonEntry.value[0]['sbj'],
                    lessonEntry.value[0]['teacher'],
                    lessonEntry.value[0]['dts'],
                    lessonEntry.value[0]['auditories'][0]['title'],
                    lessonEntry.value[0]['type'],
                    rasp[int.parse(lessonEntry.key)]
                ));
              }
            }
            returnData.addAll({daysInWeek[int.parse(dayNumberEntry.key)]: dayLectures});
          }
        }
      }
      return returnData;
    }
    catch (Exception) {
      return null;
    }
  }
}