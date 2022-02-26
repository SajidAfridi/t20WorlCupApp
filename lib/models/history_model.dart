class HistoryModel {
  String winner;
  String runnerUp;
  String host;
  String winnerFlag;
  String runnerUpFlag;
  String year;

  HistoryModel({
    required this.winner,
    required this.runnerUp,
    required this.host,
    required this.winnerFlag,
    required this.runnerUpFlag,
    required this.year,
  });

  static HistoryModel fromJSON(Map<String, dynamic> map) {
    return HistoryModel(
        winner: map['winner'],
        runnerUp: map['runnerUp'],
        host: map['host'],
        winnerFlag: map['winnerFlag'],
        runnerUpFlag: map['runnerUpFlag'],
        year: map['year']);
  }
}
