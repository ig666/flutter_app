import 'package:flutter/material.dart';

class Fulewegit extends StatefulWidget {
  Fulewegit({Key? key}) : super(key: key);
  @override
  _FulewegitState createState() => _FulewegitState();
}

class _FulewegitState extends State<Fulewegit> {
  int num = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Chip(label: Text('${this.num}')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      this.num++;
                    });
                  },
                  child: Text('按钮')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/camera');
                  },
                  child: Text('相机页面'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '12132',
                style: TextStyle(fontFamily: 'Schyler', fontSize: 20),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '12132',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF3A74F2))),
              onPressed: () {
                Navigator.pushNamed(context, '/addperson');
              },
              child: Text('新增客户'),
            ),
          )
        ],
      ),
    );
  }
}
