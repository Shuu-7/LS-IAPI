import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class LiveData {
  final Map<String, dynamic> megalist;
  final List<dynamic> blueparticipants;
  final List<dynamic> redparticipants;
  final Map<String, dynamic> frames;
  final Map<String, dynamic> bteam;
  final Map<String, dynamic> rteam;
  final List<dynamic> pdata;
  LiveData(
      {this.megalist,
      this.blueparticipants,
      this.redparticipants,
      this.frames,
      this.bteam,
      this.rteam,
      this.pdata});

  factory LiveData.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> json2) {
    Map<String, dynamic> fframes;
    for (int i = 0; i < json['frames'].length; i++) {
      if (json['frames'][i]['gameState'] == "finished") {
        fframes = json['frames'][i];
        break;
      }
    }
    return LiveData(
        megalist: json,
        blueparticipants: json['gameMetadata']['blueTeamMetadata']
            ['participantMetadata'],
        redparticipants: json['gameMetadata']['redTeamMetadata']
            ['participantMetadata'],
        frames: fframes,
        bteam: fframes['blueTeam'],
        rteam: fframes['redTeam'],
        pdata: json2['frames'][0]['participants']);
    // );
  }
}

Future<APIData> fetchRecent() async {
  final response = await http.get(
      'https://api.pandascore.co/lol/matches/upcoming?sort=begin_at&token=' +
          api_key);
  if (response.statusCode == 200) {
    var a = json.decode(response.body);
    return APIData.fromJson(a);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<APIData2> ddItems() async {
  final response = await http.get(
      'http://ddragon.leagueoflegends.com/cdn/10.3.1/data/en_US/item.json');
  if (response.statusCode == 200) {
    var a = json.decode(response.body);
    return APIData2.fromJson(a['data']);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<APIData> ddRunes() async {
  final response = await http.get(
      'http://ddragon.leagueoflegends.com/cdn/10.3.1/data/en_US/runesReforged.json');
  if (response.statusCode == 200) {
    var a = json.decode(response.body);
    return APIData.fromJson(a);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<LolTData> fetchTournaments(int leagueId) async {
  final response = await http.get(
    'https://esports-api.lolesports.com/persisted/gw/getTournamentsForLeague?hl=en-US&leagueId=' +
        leagueId.toString(),
    headers: {'x-api-key': '$key_loles'},
  );
  if (response.statusCode == 200) {
    var a = json.decode(response.body);
    return LolTData.fromJson(a['data']['leagues'][0]['tournaments']);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<StandData> fetchStandings(String tId) async {
  print(tId);
  final response = await http.get(
    'https://esports-api.lolesports.com/persisted/gw/getStandings?hl=en-US&tournamentId=' +
        tId.toString(),
    headers: {'x-api-key': '$key_loles'},
  );
  if (response.statusCode == 200) {
    var a = json.decode(response.body);

    return StandData.fromJson(a['data']['standings']);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class StandData {
  final List<dynamic> megalist;
  final List<dynamic> rankings;
  StandData({this.megalist, this.rankings});

  factory StandData.fromJson(List<dynamic> json) {
    return StandData(
        megalist: json,
        rankings: json[0]['stages'][0]['sections'][0]['rankings']);
  }
}

int getDataOnRunes(int id) {
  switch (id) {
    case 8000:
      return 2;
      break;
    case 8100:
      return 0;
      break;
    case 8300:
      return 1;
      break;
    case 8400:
      return 3;
      break;
    case 8200:
      return 4;
      break;
    case 8112:
      return 0;
      break;
    case 8124:
      return 1;
      break;
    case 8128:
      return 2;
      break;
    case 9923:
      return 3;
      break;
    case 8126:
      return 0;
      break;
    case 8139:
      return 1;
      break;
    case 8143:
      return 2;
      break;
    case 8136:
      return 0;
      break;
    case 8120:
      return 1;
      break;
    case 8138:
      return 2;
      break;
    case 8135:
      return 0;
      break;
    case 8134:
      return 1;
      break;
    case 8105:
      return 2;
      break;
    case 8106:
      return 3;
      break;
    case 8351:
      return 0;
      break;
    case 8360:
      return 1;
      break;
    case 8358:
      return 2;
      break;
    case 8306:
      return 0;
      break;
    case 8304:
      return 1;
      break;
    case 8313:
      return 2;
      break;
    case 8321:
      return 0;
      break;
    case 8316:
      return 1;
      break;
    case 8345:
      return 2;
      break;
    case 8347:
      return 0;
      break;
    case 8410:
      return 1;
      break;
    case 8352:
      return 2;
      break;
    case 8005:
      return 0;
      break;
    case 8008:
      return 1;
      break;
    case 8021:
      return 2;
      break;
    case 8010:
      return 3;
      break;
    case 9101:
      return 0;
      break;
    case 9111:
      return 1;
      break;
    case 8009:
      return 2;
      break;
    case 9104:
      return 0;
      break;
    case 9105:
      return 1;
      break;
    case 9103:
      return 2;
      break;
    case 8014:
      return 0;
      break;
    case 8017:
      return 1;
      break;
    case 8299:
      return 2;
      break;
    case 8437:
      return 0;
      break;
    case 8439:
      return 1;
      break;
    case 8465:
      return 2;
      break;
    case 8446:
      return 0;
      break;
    case 8463:
      return 1;
      break;
    case 8401:
      return 2;
      break;
    case 8429:
      return 0;
      break;
    case 8444:
      return 1;
      break;
    case 8473:
      return 2;
      break;
    case 8451:
      return 0;
      break;
    case 8453:
      return 1;
      break;
    case 8242:
      return 2;
      break;
    case 8214:
      return 0;
      break;
    case 8229:
      return 1;
      break;
    case 8230:
      return 2;
      break;
    case 8224:
      return 0;
      break;
    case 8226:
      return 1;
      break;
    case 8275:
      return 2;
      break;
    case 8210:
      return 0;
      break;
    case 8234:
      return 1;
      break;
    case 8233:
      return 2;
      break;
    case 8237:
      return 0;
      break;
    case 8232:
      return 1;
      break;
    case 8236:
      return 2;
      break;
    default:
  }
}

class LolTData {
  final List<dynamic> megalist;
  final Map<String, DateTime> sorted;
  final List<String> slugs;
  final List<DateTime> times;
  final List<String> sortid;
  LolTData({this.megalist, this.sorted, this.slugs, this.times, this.sortid});

  factory LolTData.fromJson(List<dynamic> json) {
    Map<String, DateTime> begindates = {};
    Map<String, DateTime> iddates = {};
    for (int i = 0; i < json.length; i++) {
      begindates[json[i]['slug']] = DateTime.parse(json[i]['endDate']);
      iddates[json[i]['id']] = DateTime.parse(json[i]['endDate']);
    }
    var sortedKeys = begindates.keys.toList(growable: false)
      ..sort((k1, k2) => begindates[k1].compareTo(begindates[k2]));
    Map sortedMap = new Map.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => begindates[k]);
    var idKeys = iddates.keys.toList(growable: false)
      ..sort((k1, k2) => iddates[k1].compareTo(iddates[k2]));
    Map idMap =
        new Map.fromIterable(idKeys, key: (k) => k, value: (k) => iddates[k]);
    Map<String, DateTime> fMap = {};
    int l = sortedMap.length;
    Map<String, DateTime> fMap2 = {};
    int l2 = idMap.length;
    for (int j = 0; j < l; j++) {
      String x = sortedMap.entries.last.key;
      DateTime y = sortedMap.entries.last.value;
      fMap[x] = y;
      sortedMap.remove(x);
    }
    for (int j = 0; j < l2; j++) {
      String x = idMap.entries.last.key;
      DateTime y = idMap.entries.last.value;
      fMap2[x] = y;
      idMap.remove(x);
    }
    var sl = fMap.keys.toList();
    var tl = fMap.values.toList();
    var idf = fMap2.keys.toList();
    return LolTData(
        megalist: json, sorted: fMap, slugs: sl, times: tl, sortid: idf);
  }
}

class LolESData {
  final List<dynamic> megalist;

  LolESData({this.megalist});

  factory LolESData.fromJson(List<dynamic> json) {
    return LolESData(megalist: json);
  }
}

class APIData {
  final List<dynamic> megalist;

  APIData({
    this.megalist,
  });

  factory APIData.fromJson(List<dynamic> json) {
    return APIData(megalist: json);
  }
}

class APIData2 {
  final Map<String, dynamic> megalist;

  APIData2({
    this.megalist,
  });

  factory APIData2.fromJson(Map<String, dynamic> json) {
    return APIData2(megalist: json);
  }
}

//PandaScore API KEY
const String api_key = 'UpolGbubiASJ8WQ5ZnYKoG8nfwlepSn1eSAPRz9eoZ3idvLJ50k';
//LOL ES API KEY
const String key_loles = '0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z';

const String drakelink =
    'https://raw.communitydragon.org/latest/game/data/images/ui/dragon';

Future<APIData> fetchEndRecent() async {
  final response = await http.get(
      'https://api.pandascore.co/lol/matches/past?sort=-end_at&token=' +
          api_key);
  if (response.statusCode == 200) {
    var a = json.decode(response.body);
    return APIData.fromJson(a);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

const String ddurl =
    "http://ddragon.leagueoflegends.com/cdn/10.3.1/img/champion/";

Future<LolESData> getMatchData() async {
  final response = await http.get(
    'https://esports-api.lolesports.com/persisted/gw/getSchedule?hl=en-US',
    headers: {'x-api-key': '$key_loles'},
  );
  if (response.statusCode == 200) {
    var a = json.decode(response.body);
    return LolESData.fromJson(a['data']['schedule']['events']);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<LiveData> searchForID(
    List<dynamic> megalist, String time, String o1, String o2, int i) async {
  List<dynamic> data = filterWithTime(megalist, time, o1, o2);

  //Date time shenanigans
  var tmp1 = time.split("T")[0];
  var tmp2 = time.split("T")[1];
  var tmp3 = tmp2.split(":");
  var tmp4 = int.parse(tmp3[0]) + 2 + i;
  String tmp5 = "";
  if (tmp4 < 10) {
    tmp5 = "0" + tmp4.toString();
  } else {
    if (tmp4 > 24) {
      tmp4 -= 24;
      if (tmp4 < 10) {
        tmp5 = "0" + tmp4.toString();
      } else {
        tmp5 = tmp4.toString();
      }
    } else {
      tmp5 = tmp4.toString();
    }
  }
  String ft = tmp1 + "T" + tmp5 + ":" + tmp3[1] + ":" + tmp3[2];

  //Date time shenanigans taken care of
  final response = await http.get(
      'https://feed.lolesports.com/livestats/v1/window/' +
          (int.parse(data[0]) + (i + 1)).toString() +
          '?startingTime=' +
          ft);
  final response2 = await http.get(
      'https://feed.lolesports.com/livestats/v1/details/' +
          (int.parse(data[0]) + (i + 1)).toString() +
          '?startingTime=' +
          ft);
  if (response.statusCode == 200 && response2.statusCode == 200) {
    var a = json.decode(response.body);
    var b = json.decode(response2.body);
    return LiveData.fromJson(a, b);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

List<dynamic> filterWithTime(
    List<dynamic> megalist, String time, String o1, String o2) {
  for (int i = 0; i < megalist.length; i++) {
    if (megalist[i]['startTime'] == time &&
        megalist[i]['match']['teams'][0]['code'] == o1 &&
        megalist[i]['match']['teams'][1]['code'] == o2) {
      int a = megalist[i]['match']['teams'][0]['result']['gameWins'];
      int b = megalist[i]['match']['teams'][1]['result']['gameWins'];
      List<dynamic> c = [];
      c.add(megalist[i]['match']['id']);
      c.add(a + b);
      return c;
    }
  }
  return [];
}
