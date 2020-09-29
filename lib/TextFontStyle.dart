import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyIcons.dart';

class TextFontStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("文本字体样式"),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hello world", textAlign: TextAlign.right),
          Text("Hello world", textScaleFactor: 1.5),
          Text("I'm jack ma = " * 6,
              maxLines: 1, overflow: TextOverflow.ellipsis),
          Text("I'm jack ma = " * 6, textAlign: TextAlign.center),
          Text(
            "Hello world",
            textScaleFactor: 1.5,
            style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                height: 1.2,
                backgroundColor: Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
                fontFamily: "Courier"),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Hello word:"),
            TextSpan(
              text: "www.baidu.com",
              style: TextStyle(color: Colors.red),
            ),
          ])),
          Icon(
            MyIcons.book, //自己下载的字体里面有图标
            color: Colors.purple,
          ),
          Icon(
            MyIcons.wechat,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
