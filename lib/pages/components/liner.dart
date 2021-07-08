import 'package:flutter/material.dart';

class Liner extends StatefulWidget {
  Liner({Key? key}) : super(key: key);

  @override
  _LinerState createState() => _LinerState();
}

class _LinerState extends State<Liner> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    this._animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('线条动画渲染');
    return LinearProgressIndicator(
      backgroundColor: Colors.grey[200],
      valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
          .animate(_animationController), // 从灰色变成蓝色
      value: _animationController.value,
    );
  }
}
