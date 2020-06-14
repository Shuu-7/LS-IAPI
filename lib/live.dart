import 'package:flutter/material.dart';

class LiveMatches extends StatelessWidget{
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