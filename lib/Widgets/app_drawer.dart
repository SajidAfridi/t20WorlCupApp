import 'package:flutter/material.dart';
import 'package:t20_worldcup/screens/history_screen.dart';
import 'package:t20_worldcup/screens/schedule_screen.dart';
import 'package:t20_worldcup/screens/team_page.dart';
import 'package:t20_worldcup/screens/vanues_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.purple,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.highlight,color: Colors.white,size: 80,),
                const SizedBox(height: 5,),
                const Text('T20 World Cup',style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home,color: Colors.white,),
            title: const Text('Home',style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_time,color: Colors.white,),
            title: const Text('Schedule',style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return const ScheduleScreen();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined,color: Colors.white,),
            title: const Text('Venues',style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return const Venues();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history,color: Colors.white,),
            title: const Text('History',style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return const HistoryPage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.group,color: Colors.white,),
            title: const Text('Teams',style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return const TeamPage();
              }));
            },
          ),
          const Divider(thickness: 2,color: Colors.white,),
          ListTile(
            leading: const Icon(Icons.star,color: Colors.white,),
            title: const Text('Rate our app',style: TextStyle(color: Colors.white),),
            onTap: (){},
          ),
        ],
      )
    );
  }
}
