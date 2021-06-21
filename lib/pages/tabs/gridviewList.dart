import 'package:flutter/material.dart';
import '../../mock/listData.dart' as list;

class GridviewList extends StatelessWidget {
  const GridviewList({Key? key}) : super(key: key);
  Widget _getList(BuildContext context, int index) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Container(
          height: 300,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: AspectRatio(
                      aspectRatio: 10 / 5,
                      child: Image.network(
                        list.listData[index]["imageUrl"],
                        fit: BoxFit.cover,
                      ))),
              Expanded(
                  flex: 1,
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(list.listData[index]["imageUrl"]),
                      ),
                      title: Text(
                        list.listData[index]["title"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: ElevatedButton(
                        child: Text('点我'),
                        onPressed: () =>
                            {Navigator.pushNamed(context, '/tabspage')},
                      )))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: list.listData.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: this._getList);
  }
}
