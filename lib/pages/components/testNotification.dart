import 'package:flutter/material.dart';

// 测试通知冒泡   tip:通知冒泡可以中止，但用户触摸事件不行
class TestNotification extends StatelessWidget {
  const TestNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        switch (notification.runtimeType) {
          case ScrollStartNotification:
            print("开始滚动");
            break;
          case ScrollUpdateNotification:
            print("正在滚动");
            break;
          case ScrollEndNotification:
            print("滚动停止");
            break;
          case OverscrollNotification:
            print("滚动到边界");
            break;
        }
        return false; //返回false 冒泡通知，返回true阻止冒泡通知(父级接收不到通知)
      },
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          }),
    );
  }
}
