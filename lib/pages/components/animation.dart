import 'package:flutter/material.dart';

//动画

// class ScaleAnimationRoute extends StatefulWidget {
//   @override
//   _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
// }

// //需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
// class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;
//   int num = 0;

//   initState() {
//     super.initState();
//     controller = new AnimationController(
//         duration: const Duration(seconds: 3), vsync: this);
//     //加入运动曲线
//     animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
//     //图片宽高从0变到300
//     animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
//       ..addListener(() {
//         setState(() => {this.num += 1});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           print('动画结束了哈 渲染帧数-${this.num}');
//         }
//       });
//     //启动动画(正向执行)
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//       child: Image.asset("images/a.jpeg",
//           width: animation.value, height: animation.value),
//     );
//   }

//   dispose() {
//     //路由销毁时需要释放动画资源
//     controller.dispose();
//     super.dispose();
//   }
// }

//细心的读者可能已经发现上面示例中通过addListener()和setState() 来更新UI这一步其实是通用的，如果每个动画中都加这么一句是比较繁琐的。AnimatedWidget类封装了调用setState()的细节，并允许我们将widget分离出来，重构后的代码如下：

// class AnimatedImage extends AnimatedWidget {
//   AnimatedImage({Key? key, required Animation<double> animation})
//       : super(key: key, listenable: animation);

//   @override
//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable as Animation<double>;
//     return new Center(
//       child: Image.asset("images/a.jpeg",
//           width: animation.value, height: animation.value),
//     );
//   }
// }

// class ScaleAnimationRoute extends StatefulWidget {
//   @override
//   _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
// }

// class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;

//   initState() {
//     super.initState();
//     controller = new AnimationController(
//         duration: const Duration(seconds: 3), vsync: this);
//     //图片宽高从0变到300
//     animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
//     //启动动画
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedImage(
//       animation: animation,
//     );
//   }

//   dispose() {
//     //路由销毁时需要释放动画资源
//     controller.dispose();
//     super.dispose();
//   }
// }

//动画抽离，利用构造函数
// 函数构建好处
// 1.不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。

// 2.动画构建的范围缩小了，如果没有builder，setState()将会在父组件上下文中调用，这将会导致父组件的build方法重新调用；而有了builder之后，只会导致动画widget自身的build重新调用，避免不必要的rebuild。

// 3.通过AnimatedBuilder可以封装常见的过渡效果来复用动画
class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//SingleTickerProviderStateMixin 类主要作用是创建一个TickerProvider加入到页面刷新监听中，页面每一帧没触发回调通知TickerProvider

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  initState() {
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //结束反转动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    //启动动画
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/a.jpeg"),
      builder: (BuildContext ctx, Widget? child) {
        return new Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
