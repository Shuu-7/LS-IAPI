import 'package:app/fetchers.dart';
import 'package:app/somewidgets.dart';
import 'package:app/standins.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class Tourneys extends StatefulWidget {
  int lid;
  int index;
  Tourneys(this.lid, this.index);
  @override
  _TourneysState createState() => _TourneysState(this.lid, this.index);
}

class _TourneysState extends State<Tourneys> {
  int lid;
  int index;
  static final Icon rightIcon = Icon(Icons.keyboard_arrow_right);
  static final Icon downIcon = Icon(Icons.keyboard_arrow_down);
  Icon curIcon = rightIcon;
  String stateA = "right";
  void _expand() {
    setState(() {
      if (curIcon == rightIcon) {
        curIcon = downIcon;
        stateA = "down";
      } else {
        curIcon = rightIcon;
        stateA = "right";
      }
    });
  }

  _TourneysState(this.lid, this.index);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: InkWell(
            onTap: () {
              _expand();
            },
            child: Column(children: <Widget>[
              ListTile(
                leading: Image.network(url[index]),
                title: Text(leaguesproper[index]),
                trailing: curIcon,
              ),
              Visibility(
                  visible: stateOfArrow(stateA), child: ChildTourneys(lid))
            ])));
  }
}

class ChildTourneys extends StatelessWidget {
  int lid;
  ChildTourneys(this.lid);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: fetchTournaments(this.lid),
          builder: (context, snap) {
            if (snap.hasData) {
              return Container(
                  height: (60 * snap.data.megalist.length).toDouble(),
                  child: ListView.builder(
                      itemCount: snap.data.megalist.length,
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StandingForLeague(snap.data.sortid[index].toString())));
                          },
                          child:Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 4.0),
                          child:DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: getColor(snap.data.times[index])
                          ),
                            child: ListTile(
                          leading: Padding(
                            padding: EdgeInsets.all(6.0),
                          ),
                          title:
                              Text(getFormattedString(snap.data.slugs[index])),
                        ))));
                      }));
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
          }),
    );
  }
}

String getFormattedString(String a) {
  List<String> b = a.split("_");
  String c = "";
  for (int i = 0; i < b.length; i++) {
    c += b[i].toUpperCase();
    c += " ";
  }
  return c;
}

Color getColor(DateTime endDate){
  var now = DateTime.now();
  if(endDate.compareTo(now)<0){
    return Colors.redAccent;
  } 
  else{
    return Colors.greenAccent[400];
  }
}