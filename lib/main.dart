import 'package:flutter/material.dart';
import 'package:hafta10/views/albums_view.dart';
import 'package:hafta10/views/sozluk_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API ve ListView Örneği',
      home: SozlukView(),
    );
  }
}
