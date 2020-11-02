class LectureClass{
  String subject;
  String teacher;
  String dates;
  String auditories;
  String type;
  String time;

  LectureClass(this.subject, this.teacher, this.dates, this.auditories, this.type, this.time);

  LectureClass.empty(){
    this.subject = '';
    this.teacher = '';
    this.dates = '';
    this.auditories = '';
    this.type = '';
    this.time = '';
  }


  Map<String, String> ToMap(){
    return {"time": this.time, "auditories": this.auditories, "subject": this.subject,
    "type": this.type, "teacher": this.teacher, "dates": this.dates};
  }
}