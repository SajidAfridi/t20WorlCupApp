import 'package:flutter/material.dart';
import 'package:t20_worldcup/models/history_model.dart';
import 'package:t20_worldcup/utils/schedule_hanlder.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<HistoryModel>>(
          future: ScheduleHandler.getAllHistory(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<HistoryModel>? model = snapshot.data;
              return ListView.builder(
                  itemCount: model!.length,
                  itemBuilder: (context, index) {
                    var match = snapshot.data![index];
                    return Container(
                      height: 150,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Hosted By ${match.host} (${match.year})',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 19),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Winner',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'RunnerUp',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/flags/${match.winnerFlag}',
                                      height: 50,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(match.winner,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ],
                              ),
                              const Text('vs',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              Row(
                                children: [
                                  Text(
                                    match.runnerUp,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/flags/${match.runnerUpFlag}',
                                      height: 50,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
// Row(
//   children: [
//     ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: Image.asset(
//         'assets/flags/${match.winnerFlag}',
//         height: 50,
//         width: 70,
//         fit: BoxFit.cover,
//       ),
//     ),
//     SizedBox(width: 5,),
//     Text(match.winner,style: TextStyle(color: Colors.white,fontSize: 15)),
//   ],
// ),
