import 'dart:convert';
import 'package:t20_worldcup/models/history_model.dart';
import 'package:t20_worldcup/models/schedule_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:t20_worldcup/models/venue_model.dart';
import '../models/team_model.dart';

class ScheduleHandler{
  static Future<List<ScheduleModels>> getAllMatches(BuildContext context)async{
    // this is used to delay the function by force so we can see circular indicator
    await Future.delayed(const Duration(seconds: 1));
    // We declared a list matches of type Schedule Models where we will stores the
    // Data from the JSON.
    var matches = <ScheduleModels>[];
    // Default AssetBundle is used to access the JSON
    var assetBundle = DefaultAssetBundle.of(context);
    // data will wait for the json file in assets so we can start the operations
    // and make it into readable part.
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    // json Data
    var jsonData = json.decode(data);
    // in this why we will specify the data from a whole data to schedule data
    var scheduleData = jsonData['schedule'];
    // print(scheduleData);
    for(var matchData in scheduleData){
      ScheduleModels scheduleModels = ScheduleModels.fromJSON(matchData);
      matches.add(scheduleModels);
    }
    return matches;
  }
  static Future<List<TeamModel>> getAllTeams(BuildContext context)async{
    await Future.delayed(const Duration(seconds: 1));
    var teams = <TeamModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var teamsData = jsonData['teams'];
    for(var teamData in teamsData){
      TeamModel teamModel = TeamModel.fromJSON(teamData);
      teams.add(teamModel);
    }
    return teams;
  }

  static Future<List<HistoryModel>> getAllHistory(BuildContext context)async {
    await Future.delayed(const Duration(seconds: 1));
    var teams = <HistoryModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var HistoryData = jsonData['history'];
    for(var teamData in HistoryData){
      HistoryModel historyModel = HistoryModel.fromJSON(teamData);
      teams.add(historyModel);
    }
    return teams;
  }

  static Future<List<VenuesModel>> getAllVenues(BuildContext context)async {
    await Future.delayed(const Duration(seconds: 1));
    var venues = <VenuesModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var VanuesData = jsonData['venues'];
    for(var teamData in VanuesData){
      VenuesModel vanuesModel = VenuesModel.fromJSON(teamData);
      venues.add(vanuesModel);
    }
    return venues;
  }
}