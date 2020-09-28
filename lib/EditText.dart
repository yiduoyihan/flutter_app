import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  _EditText createState() => new _EditText();
}

class _EditText extends State<EditText> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("输入框和表单"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            controller: _unameController,
            focusNode: focusNode2,
            onChanged: (v) {
              print(v);
            },
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock)),
          ),
          RaisedButton(
            child: Text("获取文本框内容"),
            onPressed: () {
              print(_unameController.text);
            },
          ),
          RaisedButton(
            child: Text("切换焦点"),
            onPressed: () {
              if (focusScopeNode == null) {
                focusScopeNode = FocusScope.of(context);
              }
              focusScopeNode.requestFocus(focusNode2);
            },
          ),
          RaisedButton(
            child: Text("隐藏键盘"),
            onPressed: () {
              // 当所有编辑框都失去焦点时键盘就会收起
              focusNode1.unfocus();
              focusNode2.unfocus();
            },
          ),
        ],
      ),
    );
  }
}

//定义一个controller
TextEditingController _unameController = TextEditingController();
