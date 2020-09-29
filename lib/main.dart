import 'package:flutter/material.dart';
import 'package:flutterapp/CheckBox.dart';
import 'package:flutterapp/Counter.dart';
import 'package:flutterapp/EditText.dart';
import 'package:flutterapp/ParentManagerState.dart';

import 'BlendManagerState.dart';
import 'ButtonStyle.dart';
import 'PicAndIcon.dart';
import 'ProgressBar.dart';
import 'SelfManagerState.dart';
import 'TextFontStyle.dart';

//程序入口

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      initialRoute: "/", //名为"/"的路由作为应用的home(首页)
      routes: {
        "/": (context) => MyHomePage(), //首页路由
        "new_counter_page": (context) => Counter(), //计数器页面
        "self_manager_state": (context) => SelfManagerState(), //自管理状态页面
        "parent_manager_state": (context) => ParentManagerState(), //父管理状态页面
        "blend_manager_state": (context) => BlendManagerState(), //混合管理状态页面
        "text_font_style": (context) => TextFontStyle(), //文本字体样式
        "button_style": (context) => ButtonStyle(), //按钮
        "pic_and_icon": (context) => PicAndIcon(), //图片和icon
        "switch_and_checkbox": (context) => CheckBox(), //单选和复选框
        "edit_text": (context) => EditText(), //输入框
        "progressbar": (context) => ProgressBar(), //进度条
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter实战book练习"),
      ),
      body: Container(
        //有一行，一行里面有3列。
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButtonColumn(context),
            // buildButtonColumn(context),
            // buildButtonColumn(context),
          ],
        ),
      ),
    );
  }

  buildButtonColumn(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
            child: Text("计数器"),
            onPressed: () {
              startActivity(context, "new_counter_page");
            }),
        RaisedButton(
            child: Text("自管理状态"),
            onPressed: () {
              startActivity(context, "self_manager_state");
            }),
        RaisedButton(
            child: Text("父管理状态"),
            onPressed: () {
              startActivity(context, "parent_manager_state");
            }),
        RaisedButton(
            child: Text("混合管理状态"),
            onPressed: () {
              startActivity(context, "blend_manager_state");
            }),
        RaisedButton(
            child: Text("文本字体样式"),
            onPressed: () {
              startActivity(context, "text_font_style");
            }),
        RaisedButton(
            child: Text("文本字体样式"),
            onPressed: () {
              startActivity(context, "button_style");
            }),
        RaisedButton(
            child: Text("图片和icon"),
            onPressed: () {
              startActivity(context, "pic_and_icon");
            }),
        RaisedButton(
            child: Text("单选和复选"),
            onPressed: () {
              startActivity(context, "switch_and_checkbox");
            }),
        RaisedButton(
            child: Text("输入框和表单"),
            onPressed: () {
              startActivity(context, "edit_text");
            }),
        RaisedButton(
            child: Text("进度指示器"),
            onPressed: () {
              startActivity(context, "progressbar");
            }),
      ],
    );
  }
}

startActivity(BuildContext context, String string) {
  Navigator.pushNamed(context, string);
}
