import 'package:flutter/material.dart';
import '../serchPage.dart';

class WarpList extends StatelessWidget {
  const WarpList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.spaceBetween,
      children: [
        ElevatedButton(
          child: Text('点我跳转到搜索页面'),
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchPage(
                      title: '我写的标题',
                    )))
          },
        ),
        ElevatedButton(
          child: Text('点我'),
          onPressed: () => {print('点击')},
        ),
        ElevatedButton(
          child: Text('点我'),
          onPressed: () => {print('点击')},
        ),
        ElevatedButton(
          child: Text('点我点我点我点我'),
          onPressed: () => {print('点击')},
        ),
        ElevatedButton(
          child: Text('点我点我点我点我'),
          onPressed: () => {print('点击')},
        ),
        ElevatedButton(
          child: Text('点我说呢嗯嗯'),
          onPressed: () => {print('点击')},
        ),
        ElevatedButton(
          child: Text('我撒谎大苏打送到骄傲的吉萨'),
          onPressed: () => {print('点击')},
        ),
        ElevatedButton(
          child: Text('点我'),
          onPressed: () => {print('点击')},
        )
      ],
    );
  }
}
