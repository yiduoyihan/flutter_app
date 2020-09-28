import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  _CheckBox createState() => new _CheckBox();
}

class _CheckBox extends State<CheckBox> {
  bool _switchSelector = false;
  bool _checkBoxSelector = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("单选框和复选框"),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelector,
            onChanged: (value) {
              setState(() {
                _switchSelector = value;
              });
            },
          ),
          Text(_switchSelector?"选中":"未选中"),
          Checkbox(
            value: _checkBoxSelector,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkBoxSelector = value;
              });
            },
          ),
          Text(_checkBoxSelector?"选中":"未选中"),
        ],
      ),
    );
  }
}
