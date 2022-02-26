class TeamModel {
  String flag;
  String fullName;
  String shortName;

  TeamModel({required this.flag, required this.fullName , required this.shortName});

  static TeamModel fromJSON(Map<String,dynamic>map)
  {
    return TeamModel(flag: map['flag'], fullName: map['fullName'], shortName: map['shortName'], );
  }
}
