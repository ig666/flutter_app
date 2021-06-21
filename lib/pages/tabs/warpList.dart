import 'package:flutter/material.dart';
import 'package:flutter_app/pages/nameSpace.dart';
// import '../serchPage.dart';

class WarpList extends StatelessWidget {
  WarpList({Key? key}) : super(key: key);
  List imageList = [
    {
      'title': '炭治郎',
      'tag': '1',
      'url':
          'http://5b0988e595225.cdn.sohucs.com/images/20200105/f7f904d37d924d43a7bd67409854e6b9.jpeg'
    },
    {
      'title': '伊之助',
      'tag': '2',
      'url':
          'http://5b0988e595225.cdn.sohucs.com/images/20200326/31424cfba041462dadc6624728fd9fb1.jpeg'
    },
    {
      'title': '善逸',
      'tag': '3',
      'url':
          'https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0126%2Fa2b60d2ej00qniixp000nc000hs00acc.jpg&thumbnail=650x2147483647&quality=80&type=jpg'
    },
    {
      'title': '时透无一郎',
      'tag': '4',
      'url': 'https://inews.gtimg.com/newsapp_bt/0/12112363474/641'
    },
    {
      'title': '胡蝶忍',
      'tag': '5',
      'url':
          'http://p1.itc.cn/images01/20200515/9b6e376b90a640f8b8cf2b1fe6c82ec8.jpeg'
    },
    {
      'title': '鬼舞辻无惨',
      'tag': '6',
      'url':
          'http://5b0988e595225.cdn.sohucs.com/images/20191108/6a9a9c096f294930a8e1b208b9af7c02.png'
    },
    {
      'title': '猗窝座',
      'tag': '7',
      'url': 'https://pic.imgdb.cn/item/5f9593851cd1bbb86ba2ef1e.gif'
    },
    {
      'title': '炎柱炼狱杏寿郎',
      'tag': '8',
      'url':
          'https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0126%2Fb1185c9dj00qniixp0012c000hs00acc.jpg&thumbnail=650x2147483647&quality=80&type=jpg'
    }
  ];

  List<Widget> getList(context) {
    List<Widget> dataList = this
        .imageList
        .map((e) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/namespace',
                  arguments: ScreenArguments(e['title'], e['url'], e['tag']));
            },
            child: Card(
              child: Hero(
                tag: e['tag'],
                child: Image.network(
                  e['url'],
                  fit: BoxFit.cover,
                  width: 130,
                  // height: 130,
                ),
              ),
            )))
        .toList();

    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.vertical,
            children: this.getList(context)));
  }
}
