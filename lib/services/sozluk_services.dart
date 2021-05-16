import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

String url = "https://owlbot.info/api/v4/dictionary/";
String token = "a2e743e6783fe8f5d1bfcf85d4cd14442af49cac";

late StreamController streamController;

searchText(String word) async {
  if (word == null || word.length == 0) {
    streamController.add(null);
    return;
  }
  streamController.add("waiting");
  Response response = await get(Uri.parse(url + word.trim()),
      headers: {"Authorization": "Token " + token});
  streamController.add(json.decode(response.body));
}
