import 'package:flutter/material.dart';
import 'package:t20_worldcup/models/team_model.dart';
import 'package:t20_worldcup/utils/schedule_hanlder.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<TeamModel>>(
          future: ScheduleHandler.getAllTeams(context),
          builder: (BuildContext context, snapshot) {
            List<TeamModel>? model = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: model!.length,
                itemBuilder: (context, index) {
                  var team = snapshot.data![index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 120,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              team.flag,
                              height: 60,
                              width: 80,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          team.fullName,
                          style: TextStyle(color: Colors.white,fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
