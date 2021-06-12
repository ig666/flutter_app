import 'package:flutter/material.dart';
import './res/listData.dart' as list;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _getList(BuildContext context, int index) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Container(
          height: 300,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Image.network(
                    list.listData[index]["imageUrl"],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
              Expanded(
                  flex: 1,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(list.listData[index]["imageUrl"]),
                    ),
                    title: Text(list.listData[index]["title"]),
                    subtitle: Text(
                      list.listData[index]["description"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      home: Scaffold(
          appBar: AppBar(
            title: Text('我的App'),
          ),
          body: ListView.builder(
              itemCount: list.listData.length, itemBuilder: this._getList)),
    );
  }
}
