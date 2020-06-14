import 'package:app/data.dart';
import 'package:app/fetchers.dart';
import 'package:app/tourneys.dart';
import 'package:flutter/material.dart';

class Standings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Standings"),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: leagueids.length,
              itemBuilder: (BuildContext ctxt, int index) {
                // return DecoratedBox(
                //     decoration: BoxDecoration(
                //       border:Border.all(color: Colors.black),
                //       borderRadius: BorderRadius.all(Radius.circular(20))
                //     ),
                return Tourneys(leagueids[leagues[index]],index);
              })),
    );
  }
}
class StandingForLeague extends StatelessWidget{
  String id;
  StandingForLeague(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Container(
      child: FutureBuilder(
      future: fetchStandings(this.id),
      builder: (context,snapstand){
      if(snapstand.hasData){
        return ListView.builder(
          itemCount: snapstand.data.rankings.length,
          itemBuilder: (context, int index){
            return Container(
              height: (50*snapstand.data.rankings[index]['teams'].length).toDouble(),
              child:ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapstand.data.rankings[index]['teams'].length ,
              itemBuilder: (context,int ind){
                return ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:<Widget>[
                    Text(snapstand.data.rankings[index]['ordinal'].toString()),
                    Padding(padding: EdgeInsets.only(left:17.0)),
                    ImageIcon(NetworkImage(snapstand.data.rankings[index]['teams'][ind]['image'])),
                    
                    ]),
                  title: Text(snapstand.data.rankings[index]['teams'][ind]['name']),
                  trailing: Text(snapstand.data.rankings[index]['teams'][ind]['record']['wins'].toString()+" - "+snapstand.data.rankings[index]['teams'][ind]['record']['losses'].toString()),);

            }));
            // return ListTile(title: Text(snapstand.data.rankings[index]['teams'][howmanyteams(snapstand.data.rankings[index]['teams'])]['name']),); 
         });
      }
      else if(snapstand.hasError){
        return Text("{$snapstand.error}");
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
    ),);
  }
}