import 'package:flutter/material.dart';
import 'package:t20_worldcup/models/venue_model.dart';

import '../utils/schedule_hanlder.dart';

class Venues extends StatelessWidget {
  const Venues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Venues'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: FutureBuilder<List<VenuesModel>>(
          future: ScheduleHandler.getAllVenues(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<VenuesModel>? model = snapshot.data;
              return ListView.builder(
                  itemCount: model!.length,
                  itemBuilder: (context, index) {
                    var match = snapshot.data![index];
                    return Container(
                      height: 270,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Country: ${match.country}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'City: ${match.city}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            match.stadium,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              match.image,
                              fit: BoxFit.cover,
                              height: 180,
                              width: double.infinity,
                            ),
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
