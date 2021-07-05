import 'package:flutter/material.dart';

class PersonData {
  late String name;
  late String passWord;
  late int phone;
  late bool checkbox = false;
  late int? cardNmber;
  late String? address;
  late List? tags;
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
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
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
          body: Form(
              key: this._formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
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
                    Container(
                      width: 50,
                      height: 50,
                      child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          value: this._personData.checkbox,
                          onChanged: (value) {
                            setState(() {
                              this._personData.checkbox = value!;
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print(this._personData.address);
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
