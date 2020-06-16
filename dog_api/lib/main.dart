import 'package:dogapi/dog_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Doggy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'My Doggy'),
    );
  }
}

Future<DogResponse> fetch() async {
  final response =
  await http.get('https://dog.ceo/api/breeds/image/random');

  if (response.statusCode == 200) {
    return DogResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load dog');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url;
  Future<DogResponse> dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<DogResponse> (
                future: dog,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Image.network(snapshot.data.message);
                  } else {
                    print(snapshot.error.toString());
                    return Text("No internet connection");
                  }
                },
              ),
              SizedBox(height: 10.0,),
              FlatButton(
                color: Colors.blue,
                child: Text('Get my Doggy'),
                onPressed: () {
                  setState(() {
                    dog = fetch();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
