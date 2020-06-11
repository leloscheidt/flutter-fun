import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  final String api = 'https://dog.ceo/api/breeds/image/random';
  var link = 'images/diamond.png';

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(link),
              ),
              MaterialButton(
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
