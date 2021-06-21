import 'package:flutter/material.dart';

class TabsCheck extends StatelessWidget {
  const TabsCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('标题'),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              tabs: <Widget>[Text('热门'), Text('排行')],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  GestureDetector(
                    child: ListTile(title: Text("第一个tab")),
                    onTap: () {
                      print('点击');
                    },
                  ),
                  ListTile(title: Text("第一个tab")),
                  ListTile(title: Text("第一个tab"))
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("第二个tab")),
                  ListTile(title: Text("第二个tab")),
                  ListTile(title: Text("第二个tab"))
                ],
              )
            ],
          ),
        ));
  }
}
