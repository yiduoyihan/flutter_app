import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerTest extends StatefulWidget {
  @override
  _GestureRecognizerTest createState() => new _GestureRecognizerTest();
}

class _GestureRecognizerTest extends State<GestureRecognizerTest> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本变色"),
      ),
      body: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "你好世界"),
          TextSpan(
              text: "点我变色",
              style: TextStyle(
                  fontSize: 30, color: _toggle ? Colors.blue : Colors.red),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }),
          TextSpan(text: "你好世界"),
        ])),
      ),
    );
  }
}
