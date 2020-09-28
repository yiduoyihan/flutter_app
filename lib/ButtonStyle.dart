import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("各种按钮"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: () {
              print(1);
            },
          ),
          FlatButton(
            child: Text("FlatButton"),
            onPressed: () { print(2);},
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () {print(3);},
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {print(4);},
          ),RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: (){print(5);},
          ),
          OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("添加"),
            onPressed: (){print(6);},
          ),
          FlatButton.icon(
            icon: Icon(Icons.info),
            label: Text("详情"),
            onPressed: (){print(7);},
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.green,
            child: Text("自定义FlatButton按钮"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {},
          ),
          RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.green,
            child: Text("自定义RaisedButton按钮"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
