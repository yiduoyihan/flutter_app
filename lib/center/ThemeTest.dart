import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeTest extends StatefulWidget {
  @override
  _ThemeTest createState() => new _ThemeTest();
}

class _ThemeTest extends State<ThemeTest> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: _themeColor), //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("测试主题"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite),
                Icon(Icons.airplanemode_active),
                Text("主题颜色")
              ],
            ),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.airplanemode_active),
                  Text("自定义颜色")
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _themeColor =
              _themeColor == Colors.teal ? Colors.blue : Colors.teal),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
