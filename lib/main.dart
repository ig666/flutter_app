import 'package:flutter/material.dart';
import 'package:flutter_app/routes/index.dart';
import 'pages/tabs/gridviewList.dart';
import 'pages/tabs/warpList.dart';
import 'pages/tabs/fulewegit.dart';

void main() {
  runApp(MaterialApp(
    title: 'App',
    initialRoute: '/',
    routes: myRoute,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> pages = [GridviewList(), Fulewegit(), WarpList()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          currentIndex: this.index,
          selectedItemColor: Color(0xFF3A74F2),
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置')
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('点击了悬浮按钮');
        },
        child: Icon(Icons.search),
      ),
      body: this.pages[this.index],
    );
  }
}
