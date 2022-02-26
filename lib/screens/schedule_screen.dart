import 'package:flutter/material.dart';
import 'package:t20_worldcup/models/schedule_models.dart';
import 'package:t20_worldcup/utils/schedule_hanlder.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<ScheduleModels>>(
            future: ScheduleHandler.getAllMatches(context),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                List<ScheduleModels>? model = snapshot.data;
                return ListView.builder(
                    itemCount: model!.length,
                    itemBuilder: (context, index) {
                      var match = snapshot.data![index];
                      return Container(
                        margin: const EdgeInsets.all(6),
                        height: 180,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.purple,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(match.date,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/flags/${match.flagOne}',
                                        height: 50,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      match.teamOne,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                                const Text('vs',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                Row(
                                  children: [
                                    Text(
                                      match.teamTwo,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/flags/${match.flagTwo}',
                                        height: 50,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              match.venue,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 48,
                              width: 90,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              ),
                              child: Center(
                                child: Text('Group ${match.group}',style: const TextStyle(fontSize: 18,color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
