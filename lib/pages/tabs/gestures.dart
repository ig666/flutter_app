import 'package:flutter/material.dart';
import 'package:flutter_app/pages/components/testNotification.dart';

//手势测试页面

class GesturesPage extends StatefulWidget {
  GesturesPage({Key? key}) : super(key: key);

  @override
  _GesturesPageState createState() => _GesturesPageState();
}

class _GesturesPageState extends State<GesturesPage> {
  String _type = '默认无点击';

  void changeType(String val) {
    if (_type == val) {
      print('$val 值相同不走渲染');
    } else {
      print('$val 值不同走渲染');
      setState(() {
        _type = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              child: Text(
                _type,
                style: TextStyle(color: Colors.brown),
              ),
            ),
            onDoubleTap: () => changeType('双击'),
            onTap: () => changeType('单击'),
            onLongPress: () => changeType('长按'),
          ),
          SizedBox(
            height: 100,
          ),
          // _Drag()
          Container(
            color: Colors.black,
            width: 200,
            height: 200,
            child: BothDirectionTestRoute(),
          ),
          SizedBox(
            height: 10,
          ),
          NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              print('${notification.toString()} 父级通知');
              return false;
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.cyan[900],
              child: TestNotification(),
            ),
          )
        ],
      ),
    );
  }
}

//手势冲突处理  分量大方向获胜

class BothDirectionTestRoute extends StatefulWidget {
  @override
  BothDirectionTestRouteState createState() =>
      new BothDirectionTestRouteState();
}

class BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            //水平方向拖动事件
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
          ),
        )
      ],
    );
  }
}

// 拖动组件

class _Drag extends StatefulWidget {
  _Drag({Key? key}) : super(key: key);

  @override
  __DragState createState() => __DragState();
}

class __DragState extends State<_Drag> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.tealAccent,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: GestureDetector(
              child: CircleAvatar(child: Icon(Icons.person_add_alt_rounded)),
              onPanUpdate: (DragUpdateDetails e) => {
                setState(
                    () => {this._left += e.delta.dx, this._top += e.delta.dy})
              },
              onPanEnd: (DragEndDetails e) => {
                print('${e.velocity} 结束时速度 ${this._left}'),
                if (this._left > 200 ||
                    this._left < 0 ||
                    this._top > 200 ||
                    this._top < 0)
                  {
                    setState(() => {this._left = 0.0, this._top = 0.0})
                  }
              },
            ),
            top: this._top,
            left: this._left,
          )
        ],
      ),
    );
  }
}
