import 'dart:convert';
import 'package:http/http.dart';
import 'package:api/soccermodel.dart';

class SoccerApi {
  final String apiUrl = "https://v3.football.api-sports.io/fixtures?live=all";

  static const headers = {
    'x-rapidapi-host': "api-football-v1.p.rapidapi.com",
    'x-rapidapi-key': "1c164e76eee8d2c54f0492aa57f07809"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl, headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList.map((dynamic item) => SoccerMatch.fromJson(item)).toList();

      return matches;
    }
  }
}
