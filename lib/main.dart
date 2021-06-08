import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter_demo'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [Text('你说呢'), Text('我说你')],
        ),
      ),
    );
  }
  // This widget is the root of your application.

}
