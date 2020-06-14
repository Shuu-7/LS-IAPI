import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'fetchers.dart';

class UpcomingMatches extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(),
    height: 300,
    width: MediaQuery.of(context).size.width,
    child: FutureBuilder(
      future: fetchRecent(),
      builder: (context, snap) {
        if (snap.hasData) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: 300,
                  maxHeight: 1400,
                  maxWidth: MediaQuery.of(context).size.width),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) =>
                    createUpMatchCard(context, snap.data.megalist, index),
                scrollDirection: Axis.horizontal,
              ));
        } else if (snap.hasError) {
          return Text("${snap.error}");
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    ),
  );
  }
}

Container createUpMatchCard(BuildContext context, List<dynamic> a, int index,) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
          elevation: 0.5,
          child: Column(
            children: <Widget>[
              Text("Best of " + a[index]['number_of_games'].toString()),
              Divider(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                          a[index]['opponents'][0]['opponent']['image_url'],
                          height: 80.0,
                          width: 80.0),
                      radius: 45.0,
                    ),
                  ),
                  Text("VS"),
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                          a[index]['opponents'][1]['opponent']['image_url'],
                          height: 80.0,
                          width: 80.0),
                      radius: 45.0,
                    ),
                  )
                ],
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 75),
                  ),
                  Expanded(
                    child:
                        Text(a[index]['opponents'][0]['opponent']['acronym']),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 90),
                  ),
                  Expanded(
                    child:
                        Text(a[index]['opponents'][1]['opponent']['acronym']),
                  ),
                  // Expanded(child: Text('T1'),)
                ],
              ),
              Divider(),
            ],
          )));
}