import 'package:flutter/material.dart';

class ScreenArguments {
  final String title;
  final String url;
  final String tag;
  ScreenArguments(this.title, this.url, this.tag);
}

class NameSpace extends StatefulWidget {
  NameSpace({Key? key}) : super(key: key);
  @override
  _NameSpaceState createState() => _NameSpaceState();
}

class _NameSpaceState extends State<NameSpace> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F7FA),
        child: Column(children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Hero(
                tag: args.tag,
                child: Image.network(
                  args.url,
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://m.imeitou.com/uploads/allimg/2019091009/4rz4ke20ced.jpg'),
            ),
            title: Text('鬼灭之刃图片111'),
            subtitle: Text(args.title),
            trailing: Icon(
              Icons.auto_awesome_sharp,
              color: Color(0xFFFFA827),
            ),
          )
        ]),
      ),
    );
  }
}
