import 'package:flutter/material.dart';

class Fulewegit extends StatefulWidget {
  Fulewegit({Key? key}) : super(key: key);
  @override
  _FulewegitState createState() => _FulewegitState();
}

class _FulewegitState extends State<Fulewegit> {
  int num = 0;
  late final TextEditingController name;
  @override
  void initState() {
    super.initState();
    this.name = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Chip(label: Text('${this.num}')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      this.num++;
                      print(this.name.text);
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
          TextField(
            controller: this.name,
          ),
          Text(this.name.text)
        ],
      ),
    );
  }
}
