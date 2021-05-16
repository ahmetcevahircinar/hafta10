import 'package:flutter/material.dart';
import 'package:hafta10/models/albums_model.dart';
import 'package:hafta10/services/albums_services.dart';
import 'dart:math';

class AlbumsView extends StatefulWidget {
  @override
  _AlbumsViewState createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  late Future<List<Albums>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ListView'),
      ),
      body: Center(
        child: FutureBuilder<List<Albums>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Albums> data = snapshot.data!;
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  Random random = new Random();
                  int colorCode = random.nextInt(10);
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCode * 100],
                    child: Row(
                      children: [
                        Text("User ID: " + data[index].userId.toString()),
                        Text("ID: " + data[index].id.toString()),
                        Text("Title: " + data[index].title),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
