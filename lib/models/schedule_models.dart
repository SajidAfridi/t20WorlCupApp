
class ScheduleModels{
  String date;
  String teamOne;
  String teamTwo;
  String flagOne;
  String flagTwo;
  String group;
  String venue;
  String time;

  ScheduleModels({
    required this.date,
    required this.teamOne,
    required this.teamTwo,
    required this.flagOne,
    required this.flagTwo,
    required this.group,
    required this.venue,
    required this.time,
  });

  // It will be used by schedule handler to
  // convert a standard json into dart json

  static ScheduleModels fromJSON(Map<String,dynamic>map){
    return ScheduleModels(
        date: map['date'],
        teamOne: map['teamOne'],
        teamTwo: map['teamTwo'],
        flagOne: map['flagOne'],
        flagTwo: map['flagTwo'],
        group: map['group'],
        venue: map['venue'],
        time: map['time'],
    );
  }
}