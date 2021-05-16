import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hafta10/models/albums_model.dart';

Future<List<Albums>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Albums.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
