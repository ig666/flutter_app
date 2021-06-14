import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final String title;
  const SearchPage({Key? key, this.title = '默认标题'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        child: Text('搜索页面'),
      ),
    );
  }
}
