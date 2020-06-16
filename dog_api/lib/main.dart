import 'dart:async';

import 'package:flutter/material.dart';

import 'dog_response.dart';
import 'i18n/localization.dart';

// TODO: put somewhere else...
String t(BuildContext c, String key) {
  return CustomLocalization.of(c).get(key);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => t(context, 'title'),
      localizationsDelegates: delegates(),
      supportedLocales: supported(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
        title: Text(t(context, 'title')),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<DogResponse>(
                future: dog,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(snapshot.data.message);
                  } else {
                    print('${snapshot.error}');
                    return Text(t(context, 'error.no-internet'));
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                color: Colors.teal,
                child: Text(t(context, 'main-button')),
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
