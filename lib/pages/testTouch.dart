// 测试点击穿透

import 'package:flutter/material.dart';

class TestTouch extends StatelessWidget {
  const TestTouch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试点击'),
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              child:
                  DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
            ),
            onPointerDown: (event) => print("down0"),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 100.0)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击")),
            ),
            onPointerDown: (event) => print("down1"),
            behavior: HitTestBehavior.opaque, //放开此行注释后可以"点透"
          )
        ],
      ),
    );
  }
}
