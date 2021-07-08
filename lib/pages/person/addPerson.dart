import 'package:flutter/material.dart';
import 'package:flutter_app/pages/components/liner.dart';

class PersonData {
  late String name;
  late String passWord;
  late int phone;
  late bool checkbox = false;
  late int? cardNmber;
  late String? address;
}

class AddPerson extends StatefulWidget {
  AddPerson({Key? key}) : super(key: key);

  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode _passWordFocus;
  PersonData _personData = PersonData();

  @override
  void initState() {
    this._passWordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    this._passWordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('重新渲染');
    return Scaffold(
        backgroundColor: Color(0xFFF5F7FA),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 44,
          title: Text(
            '新增客户',
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Color(0xFF3974C6),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
              key: this._formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Liner(),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: '姓名',
                          hintText: '请输入姓名',
                          prefixIcon: Icon(Icons.person_add),
                          border: OutlineInputBorder()),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入姓名';
                        }
                        return null;
                      },
                      onSaved: (value) => {
                        this._personData.name = value!,
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      // The validator receives the text that the user has entered.
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: '密码',
                          hintText: '请输入密码',
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder()),
                      focusNode: this._passWordFocus,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入密码';
                        }
                        return null;
                      },
                      onSaved: (value) => {this._personData.passWord = value!},
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: '手机号',
                          hintText: '请输入手机号',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder()),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入手机号';
                        }
                        return null;
                      },
                      onSaved: (value) => {
                        this._personData.phone = int.parse(value!),
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: '身份证号码',
                          hintText: '请输入身份证号码',
                          prefixIcon: Icon(Icons.card_giftcard),
                          border: OutlineInputBorder()),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      onSaved: (value) => {
                        this._personData.cardNmber =
                            value!.isEmpty ? null : int.parse(value)
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: '地址',
                          hintText: '请输入地址',
                          prefixIcon: Icon(Icons.add_reaction_sharp),
                          border: OutlineInputBorder()),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.streetAddress,
                      onSaved: (value) => {
                        this._personData.address = value!.isEmpty ? null : value
                      },
                    ),
                    SizedBox(height: 10),
                    DecoratedBox(
                        decoration: BoxDecoration(color: Colors.pink.shade300),
                        child: Transform.scale(
                            scale: 2,
                            child: Checkbox(
                                side: BorderSide(
                                    color: Colors.yellow.shade900, width: 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                value: this._personData.checkbox,
                                onChanged: (value) {
                                  setState(() {
                                    this._personData.checkbox = value!;
                                  });
                                }))),
                    Switch(
                      activeThumbImage: NetworkImage(
                          'http://img.touxiangwu.com/2020/3/mIFbQj.jpg'),
                      inactiveThumbImage: NetworkImage(
                          'http://img.touxiangwu.com/2020/3/u2uINv.jpg'),
                      value: this._personData.checkbox,
                      onChanged: (value) {
                        setState(() {
                          this._personData.checkbox = value;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Validate returns true if the ftorm is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print(this._personData.name);
                          }
                        },
                        child: Text('完成'),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}

//无限加载
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 10)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(_words.length - 1,
            //每次生成20个单词
            [
              '我说你啊',
              '我说你啊',
              '我说你啊',
              '我说你啊',
              '我说你啊',
              '我说你啊',
              '我说你啊',
              '我说你啊',
              '我说你啊',
              '我说你啊'
            ]);
      });
    });
  }
}
