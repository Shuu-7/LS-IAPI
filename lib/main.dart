import 'package:app/upcoming.dart';
import 'package:flutter/material.dart';

import 'recent.dart';
import 'standins.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home('Flutter Demo Home Page'),
    );
  }
}

class Home extends StatelessWidget {
  String title;
  ListTile makeTile(index) {
    return ListTile(
      title: Text(index.toString()),
    );
  }

  Home(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container(
            child: ListView(
              shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                children: <Widget>[
              Container(
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 0.2,
                        child: Center(child: Text('Live Matches')),
                      ),
                    //  LiveMatches(),
                      Card(
                        elevation: 0.2,
                        child: Center(child: Text('Recent Matches')),
                      ),
                      RecentMatches(),
                       Card(
                        elevation: 0.2,
                        child: Center(child: Text('Upcoming Matches')),
                      ),
                      UpcomingMatches(),
                      RaisedButton(
                        child: Text('Standings'),
                        onPressed: (){
                          Navigator.push(context,   MaterialPageRoute(builder: (context) => Standings()));
                      })
                    ],
                  )),
            ])));
  }
}
