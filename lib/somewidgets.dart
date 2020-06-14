import 'package:flutter/material.dart';

import 'createdatacard.dart';
import 'fetchers.dart';

Container originalCard(BuildContext context, Widget c, Function _button2,
    String stateA, double hData) {
  return Container(
    decoration: BoxDecoration(),
    height: hData,
    width: MediaQuery.of(context).size.width,
    child: FutureBuilder(
      future: fetchEndRecent(),
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
                    createMatchCard(context, snap.data.megalist, index, c,
                        _button2, stateA),
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

bool stateOfArrow(String stateA) {
  if (stateA == "right") {
    return false;
  } else {
    return true;
  }
}

Container createMatchCard(BuildContext context, List<dynamic> a, int index,
    Widget c, Function _button2, String stateA) {
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
              Container(
                  height: 42,
                  child: ListView(children: <Widget>[
                    ListTile(
                      title: Text("Get Details"),
                      trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: c,
                              onPressed: () {
                                _button2();
                              },
                            ),
                          ]),
                    )
                  ])),
              Visibility(
                  visible: stateOfArrow(stateA),
                  child: MatchDetails(
                      a[index]['scheduled_at'],
                      a[index]['opponents'][0]['opponent']['acronym'],
                      a[index]['opponents'][1]['opponent']['acronym'],
                      a[index]['results'][0]['score'] +
                          a[index]['results'][1]['score']))
            ],
          )));
}
class MatchDetails extends StatefulWidget{
  String time;
  String o1;
  String o2;
  int games;
  MatchDetails(this.time,this.o1,this.o2,this.games);
  @override
  _MatchDetailsState createState() => _MatchDetailsState(time,o1,o2,games);
}
class _MatchDetailsState extends State<MatchDetails> {
  String time;
  String o1;
  String o2;
  int games;
  int gno = 0;
  Color bcolor = Colors.grey;
  _MatchDetailsState(this.time, this.o1, this.o2, this.games);

  void _changeGame(int og,int nw,Key k) {
    setState(() {
      gno=nw;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 50.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: games,
            itemBuilder: (BuildContext ctxt, int index) {
              return Card(
                  child: FlatButton(
                    key: Key(index.toString()),
                    onPressed: (){
                      print("Button"+index.toString()+gno.toString());
                      _changeGame(gno,index,Key(index.toString()));
                    },
                    color: bcolor,
                      child: Text(
                "Game " + (index + 1).toString(),
              )));
            }),
      ),
      Text('Game ' +(gno+1).toString()),
      FutureBuilder(
          future: getMatchData(),
          builder: (context, snap) {
            if (snap.hasData) {
              return Container(
                child: FutureBuilder(
                    future: searchForID(snap.data.megalist, time, o1, o2,gno),
                    builder: (context, livesnap) {
                      if (livesnap.hasData) {
                        return CreateDataCard(livesnap.data);
                      } else if (livesnap.hasError) {
                        return Text("${livesnap.error}");
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
                    }),
              );
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
          })
    ]);
  }
}
