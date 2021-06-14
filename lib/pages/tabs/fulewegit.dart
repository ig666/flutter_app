import 'package:flutter/material.dart';

class Fulewegit extends StatefulWidget {
  Fulewegit({Key? key}) : super(key: key);
  @override
  _FulewegitState createState() => _FulewegitState();
}

class _FulewegitState extends State<Fulewegit> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Chip(label: Text('${this.num}')),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  this.num++;
                });
              },
              child: Text('按钮'))
        ],
      ),
    );
  }
}
