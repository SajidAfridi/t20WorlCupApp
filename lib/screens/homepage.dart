import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:t20_worldcup/Widgets/app_drawer.dart';
import 'package:t20_worldcup/screens/history_screen.dart';
import 'package:t20_worldcup/screens/schedule_screen.dart';
import 'package:t20_worldcup/screens/team_page.dart';
import 'package:t20_worldcup/screens/vanues_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widgets/home_screens_items.dart';
import '../utils/connectivity_handler.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('T20 World Cup'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.star))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 10,
            // childAspectRatio: 2,
          ),
          children: [
            HomePageWidgets.homePage(
              title: 'Schedule',
              icon: Icons.access_time,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (bld) {
                  return const ScheduleScreen();
                }));
              },
            ),
            HomePageWidgets.homePage(
                title: 'Venues',
                icon: Icons.location_on_outlined,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (bld) {
                    return const Venues();
                  }));
                }),
            HomePageWidgets.homePage(
                title: 'History',
                icon: Icons.history,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (bld) {
                    return const HistoryPage();
                  }));
                }),
            HomePageWidgets.homePage(
                title: 'Teams',
                icon: Icons.group,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (bld) {
                    return const TeamPage();
                  }));
                }),
            HomePageWidgets.homePage(
                title: 'LiveScore', icon: Icons.live_tv, onPressed: ()async{
               if(await ConnectivityHandler.isConnected()){
                var _url = 'https://www.t20worldcup.com/search?term=livescore';
                if (!await launch(_url)) throw 'Could not launch $_url';
              }
               else {
                  Fluttertoast.showToast(msg: 'Please Connect to the Internet');
               }
            },),
            HomePageWidgets.homePage(
                title: 'Highlights', icon: Icons.radio, onPressed: ()async {
              if(await ConnectivityHandler.isConnected()){
              var _url = 'https://www.youtube.com/c/ICC/videos';
              if (!await launch(_url)) throw 'Could not launch $_url';
              }
              else {
              Fluttertoast.showToast(msg: 'Please Connect to the Internet');
              }
            }),
          ],
        ),
      ),
    );
  }
}
