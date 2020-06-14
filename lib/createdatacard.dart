import 'package:app/data.dart';
import 'package:app/fetchers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateDataCard extends StatelessWidget {
  LiveData data;
  CreateDataCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          makeHeader(data.bteam),
          Container(
            height: 550,
            child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.blueparticipants.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return makeCard(data.blueparticipants[index],
                      data.bteam['participants'][index], data.pdata[index]);
                  // Text(livesnap.data
                  //     .blueparticipants[index]['summonerName']);
                }),
          ),
          makeHeader(data.rteam),
          Container(
            height: 550,
            child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.redparticipants.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return makeCard(data.redparticipants[index],
                      data.rteam['participants'][index], data.pdata[5 + index]);
                  // Text(livesnap.data
                  //     .blueparticipants[index]['summonerName']);
                }),
          ),
        ],
      ),
    );
  }
}

Card makeCard(Map<String, dynamic> player, Map<String, dynamic> playerdata,
    Map<String, dynamic> pdata) {
  return Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(),
      child: MakeListTile(player, playerdata, pdata),
    ),
  );
}

class MakeListTile extends StatefulWidget {
  Map<String, dynamic> player;
  Map<String, dynamic> playerdata;
  Map<String, dynamic> pdata;
  MakeListTile(this.player, this.playerdata, this.pdata);

  @override
  _MakeListTileState createState() =>
      _MakeListTileState(this.player, this.playerdata, this.pdata);
}

class _MakeListTileState extends State<MakeListTile> {
  Map<String, dynamic> player;
  Map<String, dynamic> playerdata;
  Map<String, dynamic> pdata;
  _MakeListTileState(this.player, this.playerdata, this.pdata);

  static final IconData a = Icons.keyboard_arrow_right;
  static final IconData b = Icons.keyboard_arrow_down;
  static Color t1 = Colors.green;
  static Color t2 = Colors.white;
  static Color t3 = Colors.white;
  static Color t4 = Colors.white;
  static Color t5 = Colors.white;
  static Color t1A = Colors.greenAccent;
  static Color t2A = Colors.white;
  static Color t3A = Colors.white;
  static Color t4A = Colors.white;
  static Color t5A = Colors.white;
  IconData c = a;
  bool stateof = false;
  bool stateof1 = false;
  bool stateof2 = false;
  bool stateof3 = false;
  bool stateof4 = false;
  void _button3() {
    setState(() {
      if (stateof == false) {
        stateof = true;
        c = b;
      } else {
        stateof = false;
        stateof1 = false;
        stateof2 = false;
        stateof3 = false;
        stateof4 = false;
        c = a;
      }
    });
  }

  void oneWasClicked() {
    setState(() {
      t1 = Colors.green;
      t1A = Colors.greenAccent;
      t2 = Colors.white;
      t2A = Colors.white;
      t3 = Colors.white;
      t3A = Colors.white;
      t4 = Colors.white;
      t4A = Colors.white;
      t5 = Colors.white;
      t5A = Colors.white;
      stateof1 = false;
      stateof = true;
      stateof3 = false;
      stateof2 = false;
    });
  }

  void twoWasClicked() {
    setState(() {
      t1 = Colors.white;
      t1A = Colors.white;
      t2 = Colors.green;
      t2A = Colors.greenAccent;
      t3 = Colors.white;
      t3A = Colors.white;
      t4 = Colors.white;
      t4A = Colors.white;
      t5 = Colors.white;
      t5A = Colors.white;
      stateof1 = true;
      stateof = false;
      stateof3 = false;
      stateof2 = false;
    });
  }

  void threeWasClicked() {
    setState(() {
      t1 = Colors.white;
      t1A = Colors.white;
      t2 = Colors.white;
      t2A = Colors.white;
      t3 = Colors.green;
      t3A = Colors.greenAccent;
      t4 = Colors.white;
      t4A = Colors.white;
      t5 = Colors.white;
      t5A = Colors.white;
      stateof1 = false;
      stateof = false;
      stateof2 = true;
      stateof3 = false;
    });
  }

  void fourWasClicked() {
    setState(() {
      t1 = Colors.white;
      t1A = Colors.white;
      t2 = Colors.white;
      t2A = Colors.white;
      t3 = Colors.white;
      t3A = Colors.white;
      t4 = Colors.green;
      t4A = Colors.greenAccent;
      t5 = Colors.white;
      t5A = Colors.white;
      stateof1 = false;
      stateof = false;
      stateof2 = false;
      stateof3 = true;
    });
  }

  void fiveWasClicked() {
    setState(() {
      t1 = Colors.white;
      t1A = Colors.white;
      t2 = Colors.white;
      t2A = Colors.white;
      t3 = Colors.white;
      t3A = Colors.white;
      t4 = Colors.white;
      t4A = Colors.white;
      t5 = Colors.green;
      t5A = Colors.greenAccent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () {
          _button3();
        },
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Image.network(
                  ddurl + player['championId'].toString() + ".png"),
            ),
            title: Text(
              player['summonerName'],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Text("Role : "),
                Text(player['role'].toUpperCase(),
                    style: TextStyle(color: Colors.black))
              ],
            ),
            trailing: Container(
                width: 60,
                child: Row(
                  children: <Widget>[
                    ImageIcon(AssetImage(
                      'assets/Position_Challenger-' + player['role'] + '.png',
                    )),
                    Icon(c, color: Colors.black, size: 30.0)
                  ],
                ))),
      ),
      Visibility(
          visible: stateof,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Tooltip(
                    message: 'Stats',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t1,
                            hoverColor: t1A,
                            onPressed: () {
                              oneWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/3286/bar-chart.svg',
                              height: 15.0,
                            )))),
                Tooltip(
                    message: 'Base Stats',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t2,
                            hoverColor: t2A,
                            onPressed: () {
                              twoWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/2199/sword.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Items',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t3,
                            hoverColor: t3A,
                            onPressed: () {
                              threeWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/14838/full-items-inside-a-shopping-bag.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Skill Order',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t4,
                            hoverColor: t4A,
                            onPressed: () {
                              fourWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/285371/comet.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Runes',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t5,
                            hoverColor: t5A,
                            onPressed: () {
                              fiveWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/59185/hexagon.svg',
                              height: 20.0,
                            )))),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
                child: GridView.count(
              childAspectRatio: 2.5,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      playerdata['totalGold'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("Total Gold Earned"),
                    // Divider(color:Colors.black)
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      playerdata['kills'].toString() +
                          "/" +
                          playerdata['deaths'].toString() +
                          "/" +
                          playerdata['assists'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("K/D/A")
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      ((pdata['killParticipation']) * 100).round().toString() +
                          "%",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("KILL PARTICIPATION")
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      pdata['creepScore'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("CREEP SCORE (CS)")
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      pdata['wardsPlaced'].toString() +
                          "/" +
                          pdata['wardsDestroyed'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("WARDS(P/D)")
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      ((pdata['championDamageShare']) * 100)
                              .round()
                              .toString() +
                          "%",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("DMG SHARE")
                  ],
                )),
              ],
            ))
          ])),
      //First Visibility ends here
      Visibility(
          visible: stateof1,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Tooltip(
                    message: 'Stats',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t1,
                            hoverColor: t1A,
                            onPressed: () {
                              oneWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/3286/bar-chart.svg',
                              height: 15.0,
                            )))),
                Tooltip(
                    message: 'Base Stats',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t2,
                            hoverColor: t2A,
                            onPressed: () {
                              twoWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/2199/sword.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Items',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t3,
                            hoverColor: t3A,
                            onPressed: () {
                              threeWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/14838/full-items-inside-a-shopping-bag.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Skill Order',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t4,
                            hoverColor: t4A,
                            onPressed: () {
                              fourWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/285371/comet.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Runes',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t5,
                            hoverColor: t5A,
                            onPressed: () {
                              fiveWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/59185/hexagon.svg',
                              height: 20.0,
                            )))),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
                child: GridView.count(
              childAspectRatio: 2.5,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      pdata['attackDamage'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("Attack Damage"),
                    // Divider(color:Colors.black)
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      pdata['abilityPower'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("Ability Power")
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      pdata['attackSpeed'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("Attack Speed")
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      pdata['lifeSteal'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("Life Steal")
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      pdata['armor'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("Armor")
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text(
                      pdata['magicResistance'].toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Text("Magic Resistance")
                  ],
                )),
              ],
            ))
          ])),
      //Second Visibility
      Visibility(
          visible: stateof2,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Tooltip(
                    message: 'Stats',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t1,
                            hoverColor: t1A,
                            onPressed: () {
                              oneWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/3286/bar-chart.svg',
                              height: 15.0,
                            )))),
                Tooltip(
                    message: 'Base Stats',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t2,
                            hoverColor: t2A,
                            onPressed: () {
                              twoWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/2199/sword.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Items',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t3,
                            hoverColor: t3A,
                            onPressed: () {
                              threeWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/14838/full-items-inside-a-shopping-bag.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Skill Order',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t4,
                            hoverColor: t4A,
                            onPressed: () {
                              fourWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/285371/comet.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Runes',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t5,
                            hoverColor: t5A,
                            onPressed: () {
                              fiveWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/59185/hexagon.svg',
                              height: 20.0,
                            )))),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
                height: 300,
                child: FutureBuilder(
                    future: ddItems(),
                    builder: (context, snapitem) {
                      if (snapitem.hasData) {
                        return ListView.builder(
                            itemCount: pdata['items'].length,
                            itemBuilder: (context, int index) {
                              return ListTile(
                                leading: Image.network(
                                    'http://ddragon.leagueoflegends.com/cdn/10.3.1/img/item/' +
                                        snapitem.data.megalist[pdata['items']
                                                [index]
                                            .toString()]['image']['full']),
                                title: Text(
                                  snapitem
                                      .data
                                      .megalist[pdata['items'][index]
                                          .toString()]['name']
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(snapitem
                                        .data
                                        .megalist[pdata['items'][index]
                                            .toString()]['gold']['total']
                                        .toString() +
                                    " G"),
                              );
                            });
                      } else if (snapitem.hasError) {
                        return Text("{$snapitem.error}");
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
                    }))
          ])),
      //Third Vis
      Visibility(
          visible: stateof3,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Tooltip(
                    message: 'Stats',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t1,
                            hoverColor: t1A,
                            onPressed: () {
                              oneWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/3286/bar-chart.svg',
                              height: 15.0,
                            )))),
                Tooltip(
                    message: 'Base Stats',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t2,
                            hoverColor: t2A,
                            onPressed: () {
                              twoWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/2199/sword.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Items',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t3,
                            hoverColor: t3A,
                            onPressed: () {
                              threeWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/14838/full-items-inside-a-shopping-bag.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Skill Order',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t4,
                            hoverColor: t4A,
                            onPressed: () {
                              fourWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/285371/comet.svg',
                              height: 20.0,
                            )))),
                Tooltip(
                    message: 'Runes',
                    child: ButtonTheme(
                        minWidth: ((MediaQuery.of(context).size.width) / 5) - 8,
                        child: FlatButton(
                            color: t5,
                            hoverColor: t5A,
                            onPressed: () {
                              fiveWasClicked();
                            },
                            child: SvgPicture.network(
                              'https://www.svgrepo.com/show/59185/hexagon.svg',
                              height: 20.0,
                            )))),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
                height: 300,
                child: FutureBuilder(
                    future: ddRunes(),
                    builder: (context, runes) {
                      if (runes.hasData) {
                        return ListView(children: <Widget>[
                          ListTile(
                            title: Text(
                              runes
                                  .data
                                  .megalist[getDataOnRunes(
                                      pdata['perkMetadata']['styleId'])]['key']
                                  .toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),
                            ),
                            trailing: Image.network(runeImg +
                                runes.data.megalist[getDataOnRunes(
                                    pdata['perkMetadata']['styleId'])]['icon']),
                          ),
                          Divider(color: Colors.black,),
                          Container(
                            height: 400,
                            child:ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context,int index){
                              return ListTile(
                                 title: Text(
                              runes
                                  .data
                                  .megalist[getDataOnRunes(
                                      pdata['perkMetadata']['styleId'])]['slots'][index]['runes'][getDataOnRunes(pdata['perkMetadata']['perks'][index])]['name']
                                  .toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Image.network(runeImg +
                                runes.data.megalist[getDataOnRunes(
                                      pdata['perkMetadata']['styleId'])]['slots'][index]['runes'][getDataOnRunes(pdata['perkMetadata']['perks'][index])]['icon']),
                                      subtitle: Text(runes
                                  .data
                                  .megalist[getDataOnRunes(
                                      pdata['perkMetadata']['styleId'])]['slots'][index]['runes'][getDataOnRunes(pdata['perkMetadata']['perks'][index])]['shortDesc']
                                  .toString(),
                              textAlign: TextAlign.right),
                              );
                          })),
                          ListTile(
                            title: Text(
                              runes
                                  .data
                                  .megalist[getDataOnRunes(
                                      pdata['perkMetadata']['subStyleId'])]['key']
                                  .toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                            ),
                            trailing: Image.network(runeImg +
                                runes.data.megalist[getDataOnRunes(
                                    pdata['perkMetadata']['subStyleId'])]['icon']),
                          ),
                          Divider(color: Colors.black,),
                          Container(
                            height: 250,
                            child:ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context,int index){
                              return ListTile(
                                 title: Text(
                             runes.data.megalist[getDataOnRunes(
                                      pdata['perkMetadata']['subStyleId'])]['slots'][index]['runes'][getDataOnRunes(pdata['perkMetadata']['perks'][index+4])]['name'].toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Image.network(runeImg +
                                runes.data.megalist[getDataOnRunes(
                                      pdata['perkMetadata']['subStyleId'])]['slots'][index]['runes'][getDataOnRunes(pdata['perkMetadata']['perks'][index+4])]['icon']),
                                      subtitle: Text(runes
                                  .data
                                  .megalist[getDataOnRunes(
                                      pdata['perkMetadata']['subStyleId'])]['slots'][index]['runes'][getDataOnRunes(pdata['perkMetadata']['perks'][index+4])]['shortDesc']
                                  .toString(),
                              textAlign: TextAlign.right),
                              );
                          }))
                        ]);
                      } else if (runes.hasError) {
                        return Text("{$runes.error}");
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
                    }))
          ]))
    ]);
  }
}

Container makeHeader(Map<String, dynamic> map) {
  return Container(
      height: 50.0,
      padding: new EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      margin: EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Card(
          elevation: 1.0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ImageIcon(AssetImage('assets/gold.png')),
                    Text(map['totalGold'].toString()),
                    ImageIcon(NetworkImage(
                        'http://ddragon.leagueoflegends.com/cdn/5.5.1/img/ui/score.png')),
                    Text(map['totalKills'].toString()),
                    ImageIcon(AssetImage('assets/baron.png')),
                    Text(map['barons'].toString()),
                    ImageIcon(AssetImage('assets/drake.png')),
                    Text(" : "),
                    Container(
                      width: 90,
                      height: 30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: map['dragons'].length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return getIcon(map['dragons'][index]);
                          }),
                    )
                  ],
                )
              ])));
}

Image getIcon(String dragon) {
  switch (dragon) {
    case "ocean":
      return Image(image: NetworkImage(drakelink + 'waterminimap.png'));
      break;
    case "infernal":
      return Image(image: NetworkImage(drakelink + 'fireminimap.png'));
      break;
    case "cloud":
      return Image(image: NetworkImage(drakelink + 'airminimap.png'));
      break;
    case "mountain":
      return Image(image: NetworkImage(drakelink + 'earthminimap.png'));
      break;
    case "elder":
      return Image(image: NetworkImage(drakelink + 'elderminimap.png'));
      break;
    default:
      return Image(image: AssetImage('assets/drake.png'));
  }
}
