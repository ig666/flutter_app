import 'package:flutter/material.dart';

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

class _AddPersonState extends State<AddPerson>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late FocusNode _passWordFocus;
  PersonData _personData = PersonData();

  late AnimationController _animationController;

  @override
  void initState() {
    this._passWordFocus = FocusNode();
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    this._passWordFocus.dispose();
    this._animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor:
                          ColorTween(begin: Colors.grey, end: Colors.blue)
                              .animate(_animationController), // 从灰色变成蓝色
                      value: _animationController.value,
                    ),
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
                    Checkbox(
                        side:
                            BorderSide(color: Colors.yellow.shade900, width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        value: this._personData.checkbox,
                        onChanged: (value) {
                          setState(() {
                            this._personData.checkbox = value!;
                          });
                        }),
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
                          // Validate returns true if the form is valid, or false otherwise.
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
