import 'package:flutter/material.dart';

class AddPerson extends StatefulWidget {
  AddPerson({Key? key}) : super(key: key);

  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode _passWordFocus;
  Map _personData = {'name': '', 'passWord': ''};

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
      body: Form(
        key: this._formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入姓名';
                }
                return null;
              },
              onSaved: (value) => {
                this._personData['name'] = value,
                this._passWordFocus.requestFocus(),
              },
            ),
            SizedBox(),
            TextFormField(
              // The validator receives the text that the user has entered.
              autovalidateMode: AutovalidateMode.always,
              focusNode: this._passWordFocus,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入密码';
                }
                return null;
              },
              onSaved: (value) => {this._personData['passWord'] = value},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(this._personData);
                  }
                },
                child: Text('完成'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
