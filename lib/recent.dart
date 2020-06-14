import 'package:app/somewidgets.dart';
import 'package:flutter/material.dart';

class RecentMatches extends StatefulWidget {
  @override
  _RecentMatchesState createState() => _RecentMatchesState();
}

class _RecentMatchesState extends State<RecentMatches> {
  static final Widget a = Icon(Icons.arrow_forward_ios);
  static final Widget b = Icon(Icons.arrow_drop_down);
  String stateA = 'right';
  double hData = 230;
  Widget c = a;
  void _button2() {
    setState(() {
      if (c == a) {
        c = b;
        hData=1550;
        stateA = 'down';
      } else {
        c = a;
        hData=230;
        stateA = 'right';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return originalCard(context, c, _button2,stateA,hData);
  }
}
